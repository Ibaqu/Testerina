import ballerina/test;
import ballerina/http;
 
// An instance of this object can be used as the test double for the `clientEndpoint`.
public client class MockHttpClient {

    remote function get(@untainted string path, map<string|string[]>? headers = (), http:TargetType targetType = http:Response) returns @tainted http:Response| http:PayloadType | http:ClientError {

        http:Response response = new;
        response.statusCode = 500;
        return response;
    }
}

@test:Config {}
public function test_CreatingATestDouble() {

    // create and assign a test double to the `clientEndpoint` object
    clientEndpoint=<http:Client>test:mock(http:Client, new MockHttpClient());

    // invoke the function to test
    string|error result = getRandomJoke("Sheldon");

    // verify that the function returns an error
    test:assertTrue(result is error);
}


@test:Config {}
public function test_StubbingToReturnASpecificValue() {
    // Create a default mock HTTP Client and assign it to the `clientEndpoint` object
    clientEndpoint = test:mock(http:Client);

    // Stub to return the specified mock response when the `get` function is called.
    test:prepare(clientEndpoint).when("get").thenReturn(getMockResponse());

    // Stub to return the specified mock response when the specified argument is passed.
    test:prepare(clientEndpoint).when("get").withArguments("/categories")
        .thenReturn(getCategoriesResponse());

    // Invoke the function to test.
    string result = checkpanic getRandomJoke("Sheldon");

    // Verify the return value against the expected string.
    test:assertEquals(result, "When Sheldon wants an egg, he cracks open a chicken.");
}

@test:Config {}
public function test_MultipleValuesForEachFunctionCall() {
    // Create a default mock HTTP Client and assign it to the `clientEndpoint` object.
    clientEndpoint = test:mock(http:Client);

    // Stub to return the corresponding value for each invocation 
    test:prepare(clientEndpoint).when("get")
        .thenReturnSequence(getCategoriesResponse(), getMockResponse());

    // Invoke the function to test
    string result = checkpanic getRandomJoke("Sheldon");

    // Verify the return value against the expected string
    test:assertEquals(result, "When Sheldon wants an egg, he cracks open a chicken.");
}