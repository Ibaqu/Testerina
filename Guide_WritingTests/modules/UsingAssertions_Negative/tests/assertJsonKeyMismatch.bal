import ballerina/test;

@test:Config {}
function testAssertJson() {
    json j1 = {
        name: "Anne",
        age: "21",
        marks: {
            maths: 99,
            english: 90,
            status: {pass: true}
        }
    };
    json j2 = {
        name2: "Amie",
        age: 21,
        marks: {
            maths: 35,
            english: 90,
            status: {pass: false}
        }
    };
    test:assertEquals(j1, j2);
}