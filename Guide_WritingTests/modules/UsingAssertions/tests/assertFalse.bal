import ballerina/test;

@test:Config {}
function testAssertFalse() {
    boolean value = false;
    test:assertFalse(value, msg = "AssertFalse failed");
}
