package cq

import (
	"context"
	"errors"
	"otomo/internal/app/interfaces/cq"
	"otomo/internal/app/model"
	"otomo/internal/app/repository"
	"otomo/internal/pkg/times"
	"strconv"
	"time"

	"cloud.google.com/go/firestore"
	pb "cloud.google.com/go/firestore/apiv1/firestorepb"
)

var _ cq.MessageSentCountQuery = (*MessageSentCountQuery)(nil)

type MessageSentCountQuery struct {
	fsClient *firestore.Client
}

func NewMessageSentCountQuery(
	fsClient *firestore.Client,
) *MessageSentCountQuery {
	return &MessageSentCountQuery{fsClient: fsClient}
}

func (mscq *MessageSentCountQuery) GetMonthlySurplusSentMessageCount(
	ctx context.Context,
	userID model.UserID,
	yearMonth model.YearMonth,
) (*model.MonthlySurplusMessageSentCount, error) {
	now := times.C.Now()
	if yearMonth.After(now) {
		return model.NewMonthlySurplusMessageSentCount(
			yearMonth, []*model.DailyMessageSentCount{},
		), nil
	}
	days := mscq.getQueryDays(now, yearMonth)

	daily := make([]*model.DailyMessageSentCount, days)
	for day := 1; day <= days; day++ {
		count, err := mscq.getDailyMessageSentCount(ctx, userID, yearMonth, day)
		if err != nil {
			return nil, err
		}
		daily[day-1] = count
	}

	return model.NewMonthlySurplusMessageSentCount(yearMonth, daily), nil
}

func (mscq *MessageSentCountQuery) getQueryDays(
	now time.Time,
	yearMonth model.YearMonth,
) int {
	if yearMonth.In(now) {
		return now.Day()
	}

	lastDay := times.C.Date(
		int(yearMonth.Year), time.Month(yearMonth.Month), 0, 0, 0, 0, 0)
	return lastDay.Day()
}

func (mscq *MessageSentCountQuery) getDailyMessageSentCount(
	ctx context.Context,
	userID model.UserID,
	yearMonth model.YearMonth,
	day int,
) (*model.DailyMessageSentCount, error) {
	var (
		start = times.C.Date(
			int(yearMonth.Year), time.Month(yearMonth.Month), day, 0, 0, 0, 0)
		end   = start.AddDate(0, 0, 1)
		alias = strconv.Itoa(day)
	)

	q := mscq.fsClient.
		Collection(repository.GetMessagesColPath(userID)).
		Where("sent_at", ">=", start).
		Where("sent_at", "<", end)
	result, err := q.NewAggregationQuery().WithCount(alias).Get(ctx)
	if err != nil {
		return nil, err
	}

	count, ok := result[alias]
	if !ok {
		return nil, errors.New("aggregation query key not found")
	}
	cv := count.(*pb.Value)

	return model.NewDailyMessageSentCount(
		model.Day(day), int(cv.GetIntegerValue()),
	), nil
}
