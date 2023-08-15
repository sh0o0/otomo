package controller

import (
	"encoding/base64"
	"otomo/internal/pkg/uuid"
	"strings"
	"testing"
)

func TestEncodeBasicAuth(t *testing.T) {
	var (
		userID   = uuid.NewString()
		password = uuid.NewString()
		payload  = userID + ":" + password
		decoded  = base64.StdEncoding.EncodeToString([]byte(payload))
	)
	type args struct {
		userID   string
		password string
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{
			name: strings.Join([]string{
				"should return encoded basic auth string",
				"when input userID and password",
			}, " "),
			args: args{userID: userID, password: password},
			want: decoded,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			if got := EncodeBasicAuth(tt.args.userID, tt.args.password); got != tt.want {
				t.Errorf("EncodeBasicAuth() = %v, want %v", got, tt.want)
			}
		})
	}
}

func TestDecodeBasicAuth(t *testing.T) {
	var (
		userID   = uuid.NewString()
		password = uuid.NewString()
		auth     = EncodeBasicAuth(userID, password)
		misAuth  = base64.StdEncoding.EncodeToString([]byte(userID + password))
	)
	type args struct {
		auth string
	}
	tests := []struct {
		name         string
		args         args
		wantUsername string
		wantPassword string
		wantIsErr    bool
	}{
		{
			name: strings.Join([]string{
				"should return userID and password",
				"when input auth",
			}, " "),
			args:         args{auth: auth},
			wantUsername: userID,
			wantPassword: password,
			wantIsErr:    false,
		},
		{
			name: strings.Join([]string{
				"should return error",
				"when input misAuth",
			}, " "),
			args:         args{misAuth},
			wantUsername: "",
			wantPassword: "",
			wantIsErr:    true,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			gotUsername, gotPassword, err := DecodeBasicAuth(tt.args.auth)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("DecodeBasicAuth() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}
			if gotUsername != tt.wantUsername {
				t.Errorf("DecodeBasicAuth() gotUsername = %v, want %v", gotUsername, tt.wantUsername)
			}
			if gotPassword != tt.wantPassword {
				t.Errorf("DecodeBasicAuth() gotPassword = %v, want %v", gotPassword, tt.wantPassword)
			}
		})
	}
}
