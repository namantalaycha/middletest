package middleware

import (
	"net/http"
)


var TestHandler = http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
	innerHandler := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
	})
	w.WriteHeader(http.StatusOK)
	innerHandler.ServeHTTP(w, r)
})
