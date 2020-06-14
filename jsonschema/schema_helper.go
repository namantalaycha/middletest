package jsonschema

import (
	"fmt"
	"github.com/xeipuuv/gojsonschema"
)

func Validate(input, schema string) bool {
	schemaLoader := gojsonschema.NewReferenceLoader(schema)
	documentLoader := gojsonschema.NewReferenceLoader(input)

	result, err := gojsonschema.Validate(schemaLoader, documentLoader)
	if err != nil {
		panic(err.Error())
	}
	if !result.Valid() {
		fmt.Printf("The document is not valid. see errors :\n")
		for _, desc := range result.Errors() {
			fmt.Printf("- %s\n", desc)
		}

		return false
		//	t.FailNow()
	}
	return true
}
