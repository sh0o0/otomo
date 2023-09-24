package model

type AuthRole uint

const (
	AdminAuthRole AuthRole = iota + 1
	UserAuthRole
)
