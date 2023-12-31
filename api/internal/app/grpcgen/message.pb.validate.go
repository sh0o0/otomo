// Code generated by protoc-gen-validate. DO NOT EDIT.
// source: message.proto

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

// Validate checks the field values on Message with the rules defined in the
// proto definition for this message. If any rules are violated, the first
// error encountered is returned, or nil if there are no violations.
func (m *Message) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on Message with the rules defined in the
// proto definition for this message. If any rules are violated, the result is
// a list of violation errors wrapped in MessageMultiError, or nil if none found.
func (m *Message) ValidateAll() error {
	return m.validate(true)
}

func (m *Message) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for Id

	// no validation rules for Text

	// no validation rules for Role

	if all {
		switch v := interface{}(m.GetSentAt()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, MessageValidationError{
					field:  "SentAt",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, MessageValidationError{
					field:  "SentAt",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetSentAt()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return MessageValidationError{
				field:  "SentAt",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	if all {
		switch v := interface{}(m.GetClientId()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, MessageValidationError{
					field:  "ClientId",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, MessageValidationError{
					field:  "ClientId",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetClientId()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return MessageValidationError{
				field:  "ClientId",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	if all {
		switch v := interface{}(m.GetPlaceExtraction()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, MessageValidationError{
					field:  "PlaceExtraction",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, MessageValidationError{
					field:  "PlaceExtraction",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetPlaceExtraction()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return MessageValidationError{
				field:  "PlaceExtraction",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	if len(errors) > 0 {
		return MessageMultiError(errors)
	}
	return nil
}

// MessageMultiError is an error wrapping multiple validation errors returned
// by Message.ValidateAll() if the designated constraints aren't met.
type MessageMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m MessageMultiError) Error() string {
	var msgs []string
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m MessageMultiError) AllErrors() []error { return m }

// MessageValidationError is the validation error returned by Message.Validate
// if the designated constraints aren't met.
type MessageValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e MessageValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e MessageValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e MessageValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e MessageValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e MessageValidationError) ErrorName() string { return "MessageValidationError" }

// Error satisfies the builtin error interface
func (e MessageValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sMessage.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = MessageValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = MessageValidationError{}

// Validate checks the field values on PlaceExtraction with the rules defined
// in the proto definition for this message. If any rules are violated, the
// first error encountered is returned, or nil if there are no violations.
func (m *PlaceExtraction) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on PlaceExtraction with the rules
// defined in the proto definition for this message. If any rules are
// violated, the result is a list of violation errors wrapped in
// PlaceExtractionMultiError, or nil if none found.
func (m *PlaceExtraction) ValidateAll() error {
	return m.validate(true)
}

func (m *PlaceExtraction) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	for idx, item := range m.GetPlaces() {
		_, _ = idx, item

		if all {
			switch v := interface{}(item).(type) {
			case interface{ ValidateAll() error }:
				if err := v.ValidateAll(); err != nil {
					errors = append(errors, PlaceExtractionValidationError{
						field:  fmt.Sprintf("Places[%v]", idx),
						reason: "embedded message failed validation",
						cause:  err,
					})
				}
			case interface{ Validate() error }:
				if err := v.Validate(); err != nil {
					errors = append(errors, PlaceExtractionValidationError{
						field:  fmt.Sprintf("Places[%v]", idx),
						reason: "embedded message failed validation",
						cause:  err,
					})
				}
			}
		} else if v, ok := interface{}(item).(interface{ Validate() error }); ok {
			if err := v.Validate(); err != nil {
				return PlaceExtractionValidationError{
					field:  fmt.Sprintf("Places[%v]", idx),
					reason: "embedded message failed validation",
					cause:  err,
				}
			}
		}

	}

	if all {
		switch v := interface{}(m.GetProcessedAt()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, PlaceExtractionValidationError{
					field:  "ProcessedAt",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, PlaceExtractionValidationError{
					field:  "ProcessedAt",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetProcessedAt()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return PlaceExtractionValidationError{
				field:  "ProcessedAt",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	if all {
		switch v := interface{}(m.GetError()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, PlaceExtractionValidationError{
					field:  "Error",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, PlaceExtractionValidationError{
					field:  "Error",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetError()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return PlaceExtractionValidationError{
				field:  "Error",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	if len(errors) > 0 {
		return PlaceExtractionMultiError(errors)
	}
	return nil
}

// PlaceExtractionMultiError is an error wrapping multiple validation errors
// returned by PlaceExtraction.ValidateAll() if the designated constraints
// aren't met.
type PlaceExtractionMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m PlaceExtractionMultiError) Error() string {
	var msgs []string
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m PlaceExtractionMultiError) AllErrors() []error { return m }

// PlaceExtractionValidationError is the validation error returned by
// PlaceExtraction.Validate if the designated constraints aren't met.
type PlaceExtractionValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e PlaceExtractionValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e PlaceExtractionValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e PlaceExtractionValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e PlaceExtractionValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e PlaceExtractionValidationError) ErrorName() string { return "PlaceExtractionValidationError" }

// Error satisfies the builtin error interface
func (e PlaceExtractionValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sPlaceExtraction.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = PlaceExtractionValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = PlaceExtractionValidationError{}

// Validate checks the field values on ExtractedPlace with the rules defined in
// the proto definition for this message. If any rules are violated, the first
// error encountered is returned, or nil if there are no violations.
func (m *ExtractedPlace) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on ExtractedPlace with the rules defined
// in the proto definition for this message. If any rules are violated, the
// result is a list of violation errors wrapped in ExtractedPlaceMultiError,
// or nil if none found.
func (m *ExtractedPlace) ValidateAll() error {
	return m.validate(true)
}

func (m *ExtractedPlace) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for Text

	if all {
		switch v := interface{}(m.GetGeocodedPlace()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, ExtractedPlaceValidationError{
					field:  "GeocodedPlace",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, ExtractedPlaceValidationError{
					field:  "GeocodedPlace",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetGeocodedPlace()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return ExtractedPlaceValidationError{
				field:  "GeocodedPlace",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	if len(errors) > 0 {
		return ExtractedPlaceMultiError(errors)
	}
	return nil
}

// ExtractedPlaceMultiError is an error wrapping multiple validation errors
// returned by ExtractedPlace.ValidateAll() if the designated constraints
// aren't met.
type ExtractedPlaceMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m ExtractedPlaceMultiError) Error() string {
	var msgs []string
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m ExtractedPlaceMultiError) AllErrors() []error { return m }

// ExtractedPlaceValidationError is the validation error returned by
// ExtractedPlace.Validate if the designated constraints aren't met.
type ExtractedPlaceValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e ExtractedPlaceValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e ExtractedPlaceValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e ExtractedPlaceValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e ExtractedPlaceValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e ExtractedPlaceValidationError) ErrorName() string { return "ExtractedPlaceValidationError" }

// Error satisfies the builtin error interface
func (e ExtractedPlaceValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sExtractedPlace.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = ExtractedPlaceValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = ExtractedPlaceValidationError{}

// Validate checks the field values on GeocodedPlace with the rules defined in
// the proto definition for this message. If any rules are violated, the first
// error encountered is returned, or nil if there are no violations.
func (m *GeocodedPlace) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on GeocodedPlace with the rules defined
// in the proto definition for this message. If any rules are violated, the
// result is a list of violation errors wrapped in GeocodedPlaceMultiError, or
// nil if none found.
func (m *GeocodedPlace) ValidateAll() error {
	return m.validate(true)
}

func (m *GeocodedPlace) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for GooglePlaceId

	if all {
		switch v := interface{}(m.GetLatLng()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, GeocodedPlaceValidationError{
					field:  "LatLng",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, GeocodedPlaceValidationError{
					field:  "LatLng",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetLatLng()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return GeocodedPlaceValidationError{
				field:  "LatLng",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	if len(errors) > 0 {
		return GeocodedPlaceMultiError(errors)
	}
	return nil
}

// GeocodedPlaceMultiError is an error wrapping multiple validation errors
// returned by GeocodedPlace.ValidateAll() if the designated constraints
// aren't met.
type GeocodedPlaceMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m GeocodedPlaceMultiError) Error() string {
	var msgs []string
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m GeocodedPlaceMultiError) AllErrors() []error { return m }

// GeocodedPlaceValidationError is the validation error returned by
// GeocodedPlace.Validate if the designated constraints aren't met.
type GeocodedPlaceValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e GeocodedPlaceValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e GeocodedPlaceValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e GeocodedPlaceValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e GeocodedPlaceValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e GeocodedPlaceValidationError) ErrorName() string { return "GeocodedPlaceValidationError" }

// Error satisfies the builtin error interface
func (e GeocodedPlaceValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sGeocodedPlace.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = GeocodedPlaceValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = GeocodedPlaceValidationError{}

// Validate checks the field values on MessageChunk with the rules defined in
// the proto definition for this message. If any rules are violated, the first
// error encountered is returned, or nil if there are no violations.
func (m *MessageChunk) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on MessageChunk with the rules defined
// in the proto definition for this message. If any rules are violated, the
// result is a list of violation errors wrapped in MessageChunkMultiError, or
// nil if none found.
func (m *MessageChunk) ValidateAll() error {
	return m.validate(true)
}

func (m *MessageChunk) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for MessageId

	// no validation rules for Text

	// no validation rules for Role

	if all {
		switch v := interface{}(m.GetSentAt()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, MessageChunkValidationError{
					field:  "SentAt",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, MessageChunkValidationError{
					field:  "SentAt",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetSentAt()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return MessageChunkValidationError{
				field:  "SentAt",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	if all {
		switch v := interface{}(m.GetClientId()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, MessageChunkValidationError{
					field:  "ClientId",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, MessageChunkValidationError{
					field:  "ClientId",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetClientId()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return MessageChunkValidationError{
				field:  "ClientId",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	// no validation rules for IsLast

	if len(errors) > 0 {
		return MessageChunkMultiError(errors)
	}
	return nil
}

// MessageChunkMultiError is an error wrapping multiple validation errors
// returned by MessageChunk.ValidateAll() if the designated constraints aren't met.
type MessageChunkMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m MessageChunkMultiError) Error() string {
	var msgs []string
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m MessageChunkMultiError) AllErrors() []error { return m }

// MessageChunkValidationError is the validation error returned by
// MessageChunk.Validate if the designated constraints aren't met.
type MessageChunkValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e MessageChunkValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e MessageChunkValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e MessageChunkValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e MessageChunkValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e MessageChunkValidationError) ErrorName() string { return "MessageChunkValidationError" }

// Error satisfies the builtin error interface
func (e MessageChunkValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sMessageChunk.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = MessageChunkValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = MessageChunkValidationError{}
