import ballerina/test;

class Person {
    public string name = "";
    public int age = 0;
    public Person? parent = ();
    private string email = "default@abc.com";
    string address = "No 20, Palm grove";
}

@test:Config {}
function testAssertNotExactEqualsObject() {
    Person p1 = new;
    Person p2 = new ();
    test:assertNotExactEquals(p1, p2, msg = "Objects are exactly equal");
}