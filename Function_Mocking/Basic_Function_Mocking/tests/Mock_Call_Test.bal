import ballerina/test;


//
// MOCK FUNCTIONS
//


// Mocking function 'intAdd'
public function mockIntAdd1(int x, int y) returns (int) {
    return x - y;
}

public function mockIntAdd2(int a, int b) returns (int) {
    return a * b;
}

// Mocking function 'stringAdd'
public function mockStringAdd(string str1) returns (string) {
    return "Hello " + str1;
}

// Mocking function 'floatAdd'
public function mockFloatAdd(float a, float b) returns (float) {
    return a - b;
}

// Mock function 'intAddMultiple'
public function mockIntAddMultiple((any|error)... args) returns (int) {
    int sum = 0;

    foreach var arg in args {
        if (arg is int) {
            sum -= arg;
        }
    }

    return  sum;
}


//
// TESTS
//


@test:Config {
}
public function Mock_call_DifferentTypes() {
    // IntAdd
    test:when(mock_intAdd).call("mockIntAdd1");
    test:assertEquals(intAdd(10, 6), 4);
    test:assertEquals(callIntAdd(10, 6), 4);

    // StringAdd
    test:when(mock_stringAdd).call("mockStringAdd");
    test:assertEquals(stringAdd("Ibaqu"), "Hello Ibaqu");

    // FloatAdd
    test:when(mock_floatAdd).call("mockFloatAdd");
    test:assertEquals(floatAdd(10.6, 4.5), 6.1);
}

@test:Config {
}
public function Mock_call_SwitchingMockFunctions() {
    // Set which function to call
    test:when(mock_intAdd).call("mockIntAdd1");
    test:assertEquals(intAdd(10, 6), 4);

    // Switch function to call
    test:when(mock_intAdd).call("mockIntAdd2");
    test:assertEquals(intAdd(10, 6), 60);

    // Switch again
    test:when(mock_intAdd).call("mockIntAdd1");
    test:assertEquals(intAdd(10, 6), 4);
}

@test:Config {}
public function Mock_call_VarargParams() {
    test:when(mock_intAddMultiple).call("mockIntAddMultiple");
    test:assertEquals(intAddMultiple(1, 3, 5), -9);
}
