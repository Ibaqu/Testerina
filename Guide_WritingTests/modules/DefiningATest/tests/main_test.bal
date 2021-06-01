import ballerina/io;
import ballerina/test;

function beforeFunc() {
    // This is the function, which will be executed before the Test functions.
}

function afterFunc() {
    // This is the function, which will be executed after the Test functions.
}

// This test function will not be executed.
@test:Config {
enable: false
}
function testFunction1() {
    io:println("I'm in test function 1!");
    test:assertTrue(true, msg = "Failed!");
}

// This test function depends on the `testFunction3`.
@test:Config{  
    before: beforeFunc,
    after: afterFunc,
    dependsOn: [testFunction3],
    dataProvider: dataGen,
    groups: ["g1"]
}
function testFunction2 (int value) returns error? {
    test:assertEquals(value, 1, msg = "value is not correct");
}


function dataGen() returns (int[][]) {
    return [[1]];
}

// This is a random test function. This will randomly execute without depending on the other functions.
// However, note that the `testFunction2` function depends on this.
@test:Config {
    groups: ["g1", "g2"]
}
function testFunction3() {
    io:println("I'm in test function 3!");
    test:assertTrue(true, msg = "Failed!");
}
