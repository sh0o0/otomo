// Code generated by protoc-gen-validate. DO NOT EDIT.
// source: location.proto

package grpcgen

import (
	"bytes"
	"errors"
	"fmt"
	"net"
	"net/mail"
	"net/url"
	"regexp"
	"strings"
	"time"
	"unicode/utf8"

	"google.golang.org/protobuf/types/known/anypb"
)

// ensure the imports are used
var (
	_ = bytes.MinRead
	_ = errors.New("")
	_ = fmt.Print
	_ = utf8.UTFMax
	_ = (*regexp.Regexp)(nil)
	_ = (*strings.Reader)(nil)
	_ = net.IPv4len
	_ = time.Duration(0)
	_ = (*url.URL)(nil)
	_ = (*mail.Address)(nil)
	_ = anypb.Any{}
)

// Validate checks the field values on Location with the rules defined in the
// proto definition for this message. If any rules are violated, the first
// error encountered is returned, or nil if there are no violations.
func (m *Location) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on Location with the rules defined in
// the proto definition for this message. If any rules are violated, the
// result is a list of violation errors wrapped in LocationMultiError, or nil
// if none found.
func (m *Location) ValidateAll() error {
	return m.validate(true)
}

func (m *Location) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for GooglePlaceId

	// no validation rules for LongName

	// no validation rules for ShortName

	// no validation rules for Address

	if all {
		switch v := interface{}(m.GetGeometry()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, LocationValidationError{
					field:  "Geometry",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, LocationValidationError{
					field:  "Geometry",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetGeometry()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return LocationValidationError{
				field:  "Geometry",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	if len(errors) > 0 {
		return LocationMultiError(errors)
	}
	return nil
}

// LocationMultiError is an error wrapping multiple validation errors returned
// by Location.ValidateAll() if the designated constraints aren't met.
type LocationMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m LocationMultiError) Error() string {
	var msgs []string
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m LocationMultiError) AllErrors() []error { return m }

// LocationValidationError is the validation error returned by
// Location.Validate if the designated constraints aren't met.
type LocationValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e LocationValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e LocationValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e LocationValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e LocationValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e LocationValidationError) ErrorName() string { return "LocationValidationError" }

// Error satisfies the builtin error interface
func (e LocationValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sLocation.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = LocationValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = LocationValidationError{}

// Validate checks the field values on Geometry with the rules defined in the
// proto definition for this message. If any rules are violated, the first
// error encountered is returned, or nil if there are no violations.
func (m *Geometry) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on Geometry with the rules defined in
// the proto definition for this message. If any rules are violated, the
// result is a list of violation errors wrapped in GeometryMultiError, or nil
// if none found.
func (m *Geometry) ValidateAll() error {
	return m.validate(true)
}

func (m *Geometry) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	if all {
		switch v := interface{}(m.GetLatLng()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, GeometryValidationError{
					field:  "LatLng",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, GeometryValidationError{
					field:  "LatLng",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetLatLng()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return GeometryValidationError{
				field:  "LatLng",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	if len(errors) > 0 {
		return GeometryMultiError(errors)
	}
	return nil
}

// GeometryMultiError is an error wrapping multiple validation errors returned
// by Geometry.ValidateAll() if the designated constraints aren't met.
type GeometryMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m GeometryMultiError) Error() string {
	var msgs []string
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m GeometryMultiError) AllErrors() []error { return m }

// GeometryValidationError is the validation error returned by
// Geometry.Validate if the designated constraints aren't met.
type GeometryValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e GeometryValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e GeometryValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e GeometryValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e GeometryValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e GeometryValidationError) ErrorName() string { return "GeometryValidationError" }

// Error satisfies the builtin error interface
func (e GeometryValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sGeometry.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = GeometryValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = GeometryValidationError{}

// Validate checks the field values on LatLng with the rules defined in the
// proto definition for this message. If any rules are violated, the first
// error encountered is returned, or nil if there are no violations.
func (m *LatLng) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on LatLng with the rules defined in the
// proto definition for this message. If any rules are violated, the result is
// a list of violation errors wrapped in LatLngMultiError, or nil if none found.
func (m *LatLng) ValidateAll() error {
	return m.validate(true)
}

func (m *LatLng) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for Latitude

	// no validation rules for Longitude

	if len(errors) > 0 {
		return LatLngMultiError(errors)
	}
	return nil
}

// LatLngMultiError is an error wrapping multiple validation errors returned by
// LatLng.ValidateAll() if the designated constraints aren't met.
type LatLngMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m LatLngMultiError) Error() string {
	var msgs []string
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m LatLngMultiError) AllErrors() []error { return m }

// LatLngValidationError is the validation error returned by LatLng.Validate if
// the designated constraints aren't met.
type LatLngValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e LatLngValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e LatLngValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e LatLngValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e LatLngValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e LatLngValidationError) ErrorName() string { return "LatLngValidationError" }

// Error satisfies the builtin error interface
func (e LatLngValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sLatLng.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = LatLngValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = LatLngValidationError{}