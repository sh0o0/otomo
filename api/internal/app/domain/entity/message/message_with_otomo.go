package message

type MessageWithOtomoID string

type Role int

const (
	UserRole Role = iota + 1
	OtomoRole
)

type MessageWithOtomo struct {
	ID       MessageWithOtomoID
	Sender   Role
	Receiver Role
	Text     string
}
