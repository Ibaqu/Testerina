import ballerina/test;

@test:Config {}
function testAssertTuples() {
    [int, string] a = [10, "John"];
    [int, string] b = [12, "John"];
    test:assertEquals(a, b);
}
