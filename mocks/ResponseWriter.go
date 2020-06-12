
package mocks

import (
	"net/http"
)

type ResponseWriter struct {
	http.ResponseWriter
	StatusCode int
}
func (m *ResponseWriter) Write(w []byte) (int, error) {
	return 0, nil
}

func (m *ResponseWriter) Header() http.Header {
	return http.Header{}
}



func (m *ResponseWriter) WriteHeader(statusCode int) {
	m.StatusCode = statusCode
}
