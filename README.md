# middletest
A testing framework which make easy to test middleware in go lang

# PACKAGE :
# 1. Assert
  to validate whether two interface are equal or not 
   
   Equal asserts that two objects are equal.
   
  example: 
    
    assert.Equal(t, 123, 123)

 Pointer variable equality is determined based on the equality of the referenced values (as opposed to the memory addresses). Function   equality cannot be determined and will always fail.

# 2. Mock
to mock the response writer and request    
 example:
    
    rr := &mocks.ResponseWriter{}
    req.Header.Add("name", str)
    
# 3. Middleware
Provide a test handler and which makes easy to test a middleware  
 example:
    
    var TestHandler = http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
	innerHandler := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
  	})
	innerHandler.ServeHTTP(w, r)
     })

# 4. Jsonschema
To validate the Response schema with givan input format   
 example:
 
  var schema = "location of schema.json"
  
  var input = "location of input.json"
  
  t = testing parameter
  
    jsonschema.Validate(t, input, schema)
