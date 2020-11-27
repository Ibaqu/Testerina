import ballerina/test;
import ballerina/math;
import ballerina/io;


(any|error)[] outputs = [];
int counter = 0;

//
// MOCK FUNCTIONS
//

// Mocking Math function 'absInt'
public function mockAbsInt(int value) returns (int) {
    return 100;
}

// Mocking IO function 'println'
public function mockPrint((any|error)... s) {
    outputs[counter] = s[0];
    counter += 1;
}

@test:Config {
}
public function Mock_call_LibraryFunction() {
    test:when(mock_absInt).call("mockAbsInt");
    test:assertEquals(math:absInt(-5), 100);
}

@test:Config {
}
public function Mock_call_IoPrintln() {
    io:println();
    test:when(mock_print).call("mockPrint");
    main();
    if (outputs[0] is anydata) {
        test:assertEquals(<anydata>outputs[0], "Hello World");
    } else {
        test:assertExactEquals(outputs[0], "Hello World");
    }
}
