import ballerina/http;

// Returns a mock HTTP response to be used for the random joke API invocation.
function getMockResponse() returns http:Response {
    http:Response mockResponse = new;
    json mockPayload = {"value":"When Chuck Norris wants an egg, he cracks open a chicken."};
    mockResponse.setPayload(mockPayload);
    return mockResponse;
}

// Returns a mock response to be used for the category API invocation.
function getCategoriesResponse() returns http:Response {
    http:Response categoriesRes = new;
    json[] payload = ["animal","food","history","money","movie"];
    categoriesRes.setJsonPayload(payload);
    return categoriesRes;
}