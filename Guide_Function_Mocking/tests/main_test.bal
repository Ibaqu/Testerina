import ballerina/test;

@test:Mock { functionName: "intAdd" }
test:MockFunction intAddMockFn = new();

@test:Config {}
function testReturn() {
    // Stub to return the specified value when the `intAdd` is invoked.
    test:when(intAddMockFn).thenReturn(20);
   
    // Stub to return the specified value when the `intAdd` is invoked with the specified arguments.
    test:when(intAddMockFn).withArguments(0, 0).thenReturn(-1);
        
    test:assertEquals(addValues(10, 6), 20, msg = "function mocking failed");
    test:assertEquals(addValues(0, 0), -1, msg = "function mocking with arguments failed");
}

@test:Config {}
function testCall() {
    // Stub to call another function when `intAdd` is called.
    test:when(intAddMockFn).call("mockIntAdd");
   
    test:assertEquals(addValues(11, 6), 5, msg = "function mocking failed");
}
    
// The mock function to be used in place of the `intAdd` function
public function mockIntAdd(int a, int b) returns int {
    return (a - b);
}

@test:Config {}
function testCallOriginal() {
    // Stub to call another function when `intAdd` is called.
    test:when(intAddMockFn).call("mockIntAdd");
   
    test:assertEquals(addValues(11, 6), 5, msg = "function mocking failed");
    
    // Stub to call the original `intAdd` function.
    test:when(intAddMockFn).callOriginal();
    test:assertEquals(addValues(11, 6), 17, msg = "function mocking failed");
}
