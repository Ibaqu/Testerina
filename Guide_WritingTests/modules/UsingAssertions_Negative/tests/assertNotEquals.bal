import ballerina/test;

@test:Config {}
function testAssertIntEquals_1() { // Redeclared Symbol

    int answer = 0;
    int a = 5;
    int b = 3;
    answer = intAdd_1(a, b);
    test:assertNotEquals(answer, 8, msg = "Matches");
}

function intAdd_1(int a, int b) returns (int) { //Redeclared Symbol
    return (a + b);
}