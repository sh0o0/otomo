package cq

import (
	"context"
	"otomo/internal/app/model"
	"otomo/internal/app/repository"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
	"otomo/test/systemtest"
	"otomo/test/testmodel"
	"testing"

	"github.com/stretchr/testify/assert"
)

var (
	msgRepo = repository.NewMessageRepository(systemtest.FirestoreClient)
)

func TestMessageSentCountQuery_GetMonthlySurplusSentMessageCount(t *testing.T) {
	var (
		now           = times.C.Now()
		thisMonth     = model.NewYearMonthFromTime(now)
		nextMonth     = model.NewYearMonth(model.Year(now.Year()), model.Month(now.Month()+1))
		lastMonthLast = times.C.Date(now.Year(), now.Month(), -1, 0, 0, 0, 0)
		lastMonth     = model.NewYearMonthFromTime(lastMonthLast)

		userID1 = model.UserID(uuid.NewString())
		daily1  = make([]*model.DailySentMessageCount, lastMonthLast.Day())

		userID2 = model.UserID(uuid.NewString())
		daily2  = make([]*model.DailySentMessageCount, now.Day())
	)
	for i := 1; i < lastMonthLast.Day(); i++ {
		msg := testmodel.DefaultMessageFactory.Times(
			times.C.Date(
				lastMonthLast.Year(),
				lastMonthLast.Month(), i, 0, 0, 0, 0),
		)
		if err := msgRepo.Add(context.Background(), userID1, msg); err != nil {
			t.Fatal(err)
		}
		daily1[i-1] = model.NewDailySentMessageCount(model.Day(i), 1)
	}
	for i := 1; i < now.Day(); i++ {
		msg := testmodel.DefaultMessageFactory.Times(
			times.C.Date(
				now.Year(),
				now.Month(), i, 0, 0, 0, 0),
		)
		if err := msgRepo.Add(context.Background(), userID2, msg); err != nil {
			t.Fatal(err)
		}
		daily2[i-1] = model.NewDailySentMessageCount(model.Day(i), 1)
	}

	type args struct {
		ctx       context.Context
		userID    model.UserID
		yearMonth model.YearMonth
	}
	tests := []struct {
		name      string
		args      args
		want      *model.MonthlySurplusSentMessageCount
		wantIsErr bool
	}{
		{
			name: "Should return whole month count when give last month",
			args: args{
				ctx:       context.Background(),
				userID:    userID1,
				yearMonth: lastMonth,
			},
			want: &model.MonthlySurplusSentMessageCount{
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
			want: &model.MonthlySurplusSentMessageCount{
				YearMonth: thisMonth,
				Daily:     daily2,
			},
			wantIsErr: false,
		},
		{
			name: "Should return error when give next month",
			args: args{
				ctx:       context.Background(),
				userID:    "",
				yearMonth: nextMonth,
			},
			want:      nil,
			wantIsErr: true,
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
