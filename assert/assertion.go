package assert

import (
	"fmt"
	"reflect"
	"strings"
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

func Equal(t ,src interface{}, dst interface{}, messages ...interface{}) {
	if !objectsAreEqual(src, dst) {
		t. fail(fmt.Sprintf("%#v %s %#v%s", src, "does not equal", dst,
			formatMessages(messages...)))
	}
}
func formatMessages(messages ...interface{}) string {
	// Concatenate messages together.
	var fm strings.Builder
	for _, message := range messages {
		fm.WriteString(" ")

		// Format message then wrap with square brackets if only
		// whitespace.
		m := fmt.Sprintf("%v", message)
		if strings.TrimSpace(m) == "" {
			m = fmt.Sprintf("[%s]", m)
		}
		fm.WriteString(m)
	}

	if fm.Len() == 0 {
		return ""
	}
	return "," + fm.String()
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
