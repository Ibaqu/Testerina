import ballerina/test;

@test:Config {}
function testAssertTrue() {
    boolean value = false;
    test:assertTrue(value, msg = "AssertTrue failed");
}