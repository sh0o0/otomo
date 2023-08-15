package errs

func IsNotFoundErr(err error) bool {
	if err == nil {
		return false
	}
	if e, ok := err.(*Error); ok {
		return e.Cause == CauseNotFound
	}
	return false
}
