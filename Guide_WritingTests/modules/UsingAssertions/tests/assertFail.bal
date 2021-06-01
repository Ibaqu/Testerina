import ballerina/test;

@test:Config {}
function foo() {
    error? e = trap bar(); // Expecting `bar()` to panic
    if (e is error) {
        test:assertEquals(e.message().toString(), "Invalid Operation", msg = "Invalid error reason"); // Some other assertions
    } else {
        test:assertFail(msg = "Expected an error");
    }
}

function bar() {
    panic error("Invalid Operation");
}