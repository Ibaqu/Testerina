import ballerina/test;

@test:Config {}
function testAssertStringAndInt() {
    test:assertEquals(1, "1");
}