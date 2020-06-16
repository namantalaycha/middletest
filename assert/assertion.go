package assert

import (
	"fmt"
	"reflect"
	"testing"
)

func Equalt(t *testing.T, expected, actual interface{}) bool {

	if !objectsAreEqual(expected, actual) {
		 t.Fail()
		return false
	}
	return true

}

func Equalb(b *testing.B, expected, actual interface{}) bool {

	if !objectsAreEqual(expected, actual) {
		b.Fail()
		return false
	}
	return true

}


func objectsAreEqual(a, b interface{}) bool {
	if reflect.TypeOf(a) != reflect.TypeOf(b) {
		return false
	}

	if reflect.DeepEqual(a, b) {
		return true
	}

	if fmt.Sprintf("%#v", a) == fmt.Sprintf("%#v", b) {
		return true
	}

	return false
}
