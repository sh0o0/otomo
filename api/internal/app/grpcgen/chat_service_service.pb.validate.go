// Code generated by protoc-gen-validate. DO NOT EDIT.
// source: chat_service_service.proto

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

// Validate checks the field values on ChatService_SendMessageRequest with the
// rules defined in the proto definition for this message. If any rules are
// violated, the first error encountered is returned, or nil if there are no violations.
func (m *ChatService_SendMessageRequest) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on ChatService_SendMessageRequest with
// the rules defined in the proto definition for this message. If any rules
// are violated, the result is a list of violation errors wrapped in
// ChatService_SendMessageRequestMultiError, or nil if none found.
func (m *ChatService_SendMessageRequest) ValidateAll() error {
	return m.validate(true)
}

func (m *ChatService_SendMessageRequest) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	if l := utf8.RuneCountInString(m.GetText()); l < 1 || l > 10000 {
		err := ChatService_SendMessageRequestValidationError{
			field:  "Text",
			reason: "value length must be between 1 and 10000 runes, inclusive",
		}
		if !all {
			return err
		}
		errors = append(errors, err)
	}

	if len(errors) > 0 {
		return ChatService_SendMessageRequestMultiError(errors)
	}
	return nil
}

// ChatService_SendMessageRequestMultiError is an error wrapping multiple
// validation errors returned by ChatService_SendMessageRequest.ValidateAll()
// if the designated constraints aren't met.
type ChatService_SendMessageRequestMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m ChatService_SendMessageRequestMultiError) Error() string {
	var msgs []string
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m ChatService_SendMessageRequestMultiError) AllErrors() []error { return m }

// ChatService_SendMessageRequestValidationError is the validation error
// returned by ChatService_SendMessageRequest.Validate if the designated
// constraints aren't met.
type ChatService_SendMessageRequestValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e ChatService_SendMessageRequestValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e ChatService_SendMessageRequestValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e ChatService_SendMessageRequestValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e ChatService_SendMessageRequestValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e ChatService_SendMessageRequestValidationError) ErrorName() string {
	return "ChatService_SendMessageRequestValidationError"
}

// Error satisfies the builtin error interface
func (e ChatService_SendMessageRequestValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sChatService_SendMessageRequest.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = ChatService_SendMessageRequestValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = ChatService_SendMessageRequestValidationError{}

// Validate checks the field values on ChatService_SendMessageStreamResponse
// with the rules defined in the proto definition for this message. If any
// rules are violated, the first error encountered is returned, or nil if
// there are no violations.
func (m *ChatService_SendMessageStreamResponse) Validate() error {
	return m.validate(false)
}

// ValidateAll checks the field values on ChatService_SendMessageStreamResponse
// with the rules defined in the proto definition for this message. If any
// rules are violated, the result is a list of violation errors wrapped in
// ChatService_SendMessageStreamResponseMultiError, or nil if none found.
func (m *ChatService_SendMessageStreamResponse) ValidateAll() error {
	return m.validate(true)
}

func (m *ChatService_SendMessageStreamResponse) validate(all bool) error {
	if m == nil {
		return nil
	}

	var errors []error

	// no validation rules for Text

	if all {
		switch v := interface{}(m.GetSentAt()).(type) {
		case interface{ ValidateAll() error }:
			if err := v.ValidateAll(); err != nil {
				errors = append(errors, ChatService_SendMessageStreamResponseValidationError{
					field:  "SentAt",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		case interface{ Validate() error }:
			if err := v.Validate(); err != nil {
				errors = append(errors, ChatService_SendMessageStreamResponseValidationError{
					field:  "SentAt",
					reason: "embedded message failed validation",
					cause:  err,
				})
			}
		}
	} else if v, ok := interface{}(m.GetSentAt()).(interface{ Validate() error }); ok {
		if err := v.Validate(); err != nil {
			return ChatService_SendMessageStreamResponseValidationError{
				field:  "SentAt",
				reason: "embedded message failed validation",
				cause:  err,
			}
		}
	}

	if len(errors) > 0 {
		return ChatService_SendMessageStreamResponseMultiError(errors)
	}
	return nil
}

// ChatService_SendMessageStreamResponseMultiError is an error wrapping
// multiple validation errors returned by
// ChatService_SendMessageStreamResponse.ValidateAll() if the designated
// constraints aren't met.
type ChatService_SendMessageStreamResponseMultiError []error

// Error returns a concatenation of all the error messages it wraps.
func (m ChatService_SendMessageStreamResponseMultiError) Error() string {
	var msgs []string
	for _, err := range m {
		msgs = append(msgs, err.Error())
	}
	return strings.Join(msgs, "; ")
}

// AllErrors returns a list of validation violation errors.
func (m ChatService_SendMessageStreamResponseMultiError) AllErrors() []error { return m }

// ChatService_SendMessageStreamResponseValidationError is the validation error
// returned by ChatService_SendMessageStreamResponse.Validate if the
// designated constraints aren't met.
type ChatService_SendMessageStreamResponseValidationError struct {
	field  string
	reason string
	cause  error
	key    bool
}

// Field function returns field value.
func (e ChatService_SendMessageStreamResponseValidationError) Field() string { return e.field }

// Reason function returns reason value.
func (e ChatService_SendMessageStreamResponseValidationError) Reason() string { return e.reason }

// Cause function returns cause value.
func (e ChatService_SendMessageStreamResponseValidationError) Cause() error { return e.cause }

// Key function returns key value.
func (e ChatService_SendMessageStreamResponseValidationError) Key() bool { return e.key }

// ErrorName returns error name.
func (e ChatService_SendMessageStreamResponseValidationError) ErrorName() string {
	return "ChatService_SendMessageStreamResponseValidationError"
}

// Error satisfies the builtin error interface
func (e ChatService_SendMessageStreamResponseValidationError) Error() string {
	cause := ""
	if e.cause != nil {
		cause = fmt.Sprintf(" | caused by: %v", e.cause)
	}

	key := ""
	if e.key {
		key = "key for "
	}

	return fmt.Sprintf(
		"invalid %sChatService_SendMessageStreamResponse.%s: %s%s",
		key,
		e.field,
		e.reason,
		cause)
}

var _ error = ChatService_SendMessageStreamResponseValidationError{}

var _ interface {
	Field() string
	Reason() string
	Key() bool
	Cause() error
	ErrorName() string
} = ChatService_SendMessageStreamResponseValidationError{}