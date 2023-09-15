package errs

type (
	Cause  string
	Domain string
	Field  string
)

// Causes
const (
	// Internal error.
	CauseInternal Cause = "internal"

	// Invalid argument.
	CauseInvalidArg Cause = "invalid_argument"

	// Anything is not found from context.
	CauseNotFoundFromContext Cause = "not_found_from_context"

	// The concept itself does not exist.
	CauseNotExist Cause = "not_exist"

	// Anything is not found.
	CauseNotFound Cause = "not_found"
)

// Domains
const (
	DomainUser    Domain = "User"
	DomainMessage Domain = "Message"
	DomainOtomo   Domain = "Otomo"
)

// Fields
const (
	FieldNone     Field = ""
	FieldID       Field = "id"
	FieldRole     Field = "role"
	FieldAuthRole Field = "auth_role"
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
