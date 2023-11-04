package jschema

import (
	"github.com/invopop/jsonschema"
)

func ReflectMin(v any) *jsonschema.Schema {
	f := jsonschema.Reflector{
		DoNotReference: true,
	}
	schema := f.Reflect(v)
	schema.AdditionalProperties = nil
	schema.ContentSchema = nil
	schema.Version = ""
	return schema
}
