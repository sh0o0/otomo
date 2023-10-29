package errs

import "fmt"

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

	// Permission denied.
	CausePermissionDenied Cause = "permission_denied"

	// Unavailable.
	CauseUnavailable Cause = "unavailable"

	// Resource exhausted.
	CauseResourceExhausted Cause = "resource_exhausted"
)

// Domains
const (
	DomainAuth         Domain = "Auth"
	DomainUser         Domain = "User"
	DomainMessage      Domain = "Message"
	DomainOtomo        Domain = "Otomo"
	DomainOtomoProfile Domain = "OtomoProfile"
	DomainGeo          Domain = "Geo"
)

// Fields
const (
	FieldNone     Field = ""
	FieldID       Field = "id"
	FieldUserID   Field = "user_id"
	FieldRole     Field = "role"
	FieldAuthRole Field = "auth_role"
	FieldAbility  Field = "ability"
	FieldSentAt   Field = "sent_at"
)

type Error struct {
	Message string
	Cause   Cause
	Domain  Domain
	Field   Field
}

func (e *Error) Error() string {
	return fmt.Sprintf(
		"message: %s, cause: %s, domain: %s, field: %s",
		e.Message, e.Cause, e.Domain, e.Field,
	)
}
