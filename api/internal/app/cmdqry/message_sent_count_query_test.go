package cq

import (
	"context"
	"otomo/internal/app/model"
	"otomo/internal/app/repository"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
	"otomo/test/systemtest"
	"otomo/test/testmodel"
	"otomo/test/testutil"
	"testing"

	"github.com/stretchr/testify/assert"
)

func init() {
	testutil.SetMockClock()
}

var (
	msgRepo = repository.NewMessageRepository(systemtest.FirestoreClient)
)

func TestMessageSentCountQuery_GetMonthlySurplusSentMessageCount(t *testing.T) {
	var (
		now           = times.C.Now()
		thisMonth     = model.NewYearMonthFromTime(now)
		nextMonth     = model.NewYearMonth(model.Year(now.Year()), model.Month(now.Month()+1))
		lastMonthLast = times.C.Date(now.Year(), now.Month(), 0, 0, 0, 0, 0)
		lastMonth     = model.NewYearMonthFromTime(lastMonthLast)

		userID1 = model.UserID(uuid.NewString())
		daily1  = make([]*model.DailyMessageSentCount, lastMonthLast.Day())

		userID2 = model.UserID(uuid.NewString())
		daily2  = make([]*model.DailyMessageSentCount, now.Day())
	)
	for day := 1; day <= lastMonthLast.Day(); day++ {
		msg := testmodel.DefaultMessageFactory.SentAt(
			times.C.Date(
				lastMonthLast.Year(),
				lastMonthLast.Month(), day, 0, 0, 0, 0),
		).New()
		if err := msgRepo.Add(context.Background(), userID1, msg); err != nil {
			t.Fatal(err)
		}
		daily1[day-1] = model.NewDailyMessageSentCount(model.Day(day), 1)
	}
	for day := 1; day <= now.Day(); day++ {
		msg := testmodel.DefaultMessageFactory.SentAt(
			times.C.Date(
				now.Year(),
				now.Month(), day, 0, 0, 0, 0),
		).New()
		if err := msgRepo.Add(context.Background(), userID2, msg); err != nil {
			t.Fatal(err)
		}
		daily2[day-1] = model.NewDailyMessageSentCount(model.Day(day), 1)
	}

	type args struct {
		ctx       context.Context
		userID    model.UserID
		yearMonth model.YearMonth
	}
	tests := []struct {
		name      string
		args      args
		want      *model.MonthlySurplusMessageSentCount
		wantIsErr bool
	}{
		{
			name: "Should return whole month count when give last month",
			args: args{
				ctx:       context.Background(),
				userID:    userID1,
				yearMonth: lastMonth,
			},
			want: &model.MonthlySurplusMessageSentCount{
				YearMonth: lastMonth,
				Daily:     daily1,
			},
			wantIsErr: false,
		},
		{
			name: "Should return until today count when give this month",
			args: args{
				ctx:       context.Background(),
				userID:    userID2,
				yearMonth: thisMonth,
			},
			want: &model.MonthlySurplusMessageSentCount{
				YearMonth: thisMonth,
				Daily:     daily2,
			},
			wantIsErr: false,
		},
		{
			name: "Should return empty count when give next month",
			args: args{
				ctx:       context.Background(),
				userID:    "",
				yearMonth: nextMonth,
			},
			want: &model.MonthlySurplusMessageSentCount{
				YearMonth: nextMonth,
				Daily:     []*model.DailyMessageSentCount{},
			},
			wantIsErr: false,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			mscq := &MessageSentCountQuery{
				fsClient: systemtest.FirestoreClient,
			}
			got, err := mscq.GetMonthlySurplusSentMessageCount(
				tt.args.ctx,
				tt.args.userID,
				tt.args.yearMonth,
			)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("MessageSentCountQuery.GetMonthlySurplusSentMessageCount() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}

			assert.Exactly(t, tt.want, got)
		})
	}
}
