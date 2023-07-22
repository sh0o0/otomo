package errs

type (
	Cause  string
	Domain string
	Field  string
)

// Causes
const (
	CauseNotFoundFromContext Cause = "not_found_from_context"
)

// Domains
const (
	DomainUser Domain = "User"
)

// Fields
const (
	FieldID Field = "id"
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
