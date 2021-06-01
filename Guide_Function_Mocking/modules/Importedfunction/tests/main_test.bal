import ballerina/test;
import ballerina/io;

@test:Mock {
    moduleName: "ballerina/io",
    functionName: "println"
}
test:MockFunction printlnMockFn = new();

int tally = 0;

// This is a function that can be called in place of the `io:println` function.
public function mockPrint(any|error... val) {
    tally = tally + 1;
}

@test:Config {}
function testCall() {
    test:when(printlnMockFn).call("mockPrint");

    io:println("Testing 1");
    io:println("Testing 2");
    io:println("Testing 3");

    test:assertEquals(tally, 3);
}