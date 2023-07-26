package errs

type (
	Cause  string
	Domain string
	Field  string
)

// Causes
const (
	CauseNotFoundFromContext Cause = "not_found_from_context"

	// The concept itself does not exist.
	CauseNotExist Cause = "not_exist"
)

// Domains
const (
	DomainUser             Domain = "User"
	DomainMessageWithOtomo Domain = "MessageWithOtomo"
)

// Fields
const (
	FieldID   Field = "id"
	FieldRole Field = "role"
)

type Error struct {
	Message string
	Cause   Cause
	Domain  Domain
	Field   Field
}

func (e *Error) Error() string {
	return e.Message
}
