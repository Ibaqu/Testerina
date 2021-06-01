import ballerina/test;

class Person_1 { //Redeclared Symbol
    public string name = "";
    public int age = 0;
    public Person_1? parent = ();
    private string email = "default@abc.com";
    string address = "No 20, Palm grove";
}

@test:Config {}
function testAssertExactEqualsObject() {
    Person_1 p1 = new;
    Person_1 p2 = p1;
    test:assertExactEquals(p1, p2, msg = "Objects are not exactly equal");
}
