package require

import (
	"fmt"
	"reflect"
	"testing"
)
type Assertions struct {
	t TestingT
	fail func(interface{})
}

func New(t TestingT) *Assertions {
	return &Assertions{
		t: t,
	}
}




type TestingT interface {
	Errorf(format string, args ...interface{})

}
type tHelper interface {
	Helper()
}
func Equal(t *testing.T, expected, actual interface{}, msgAndArgs ...interface{}) bool {

	if !objectsAreEqual(expected, actual) {
		t.FailNow()
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

