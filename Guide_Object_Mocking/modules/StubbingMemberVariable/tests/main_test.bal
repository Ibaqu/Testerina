import ballerina/test;

@test:Config {}
function testMemberVariable() {
    int mockProductCode = 2;
    // Create a mockClient which represents product with the code `mockProductCode`
    ProductClient mockClient = test:mock(ProductClient);
    // Stub the member variable `productCode`
    test:prepare(mockClient).getMember("productCode").thenReturn(mockProductCode);
    // Replace `productClient` with the `mockClient`
    productClient = mockClient;
    // Assert for the mocked product name.
    test:assertEquals(getProductName(), "Bread");
}