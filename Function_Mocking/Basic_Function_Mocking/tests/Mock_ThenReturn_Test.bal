import ballerina/test;

@test:Config {
}
public function Mock_thenReturn_DifferentTypes() {
    test:when(mock_intAdd).thenReturn(5);
    test:assertEquals(intAdd(10, 4), 5);

    test:when(mock_stringAdd).thenReturn("testing");
    test:assertEquals(stringAdd("string"), "testing");

    test:when(mock_floatAdd).thenReturn(10.5);
    test:assertEquals(floatAdd(10, 5), 10.5);
}

@test:Config {
    dependsOn: ["Mock_thenReturn_DifferentTypes"]
}
public function Mock_thenReturn_withArguments() {
    test:when(mock_intAdd).withArguments(20, 14).thenReturn(100);
    test:assertEquals(intAdd(20, 14), 100);
    test:assertEquals(intAdd(10, 4), 5); 

    test:when(mock_stringAdd).withArguments("string1").thenReturn("test");
    test:assertEquals(stringAdd("string1"), "test");
    test:assertEquals(stringAdd("string"), "testing");

    test:when(mock_floatAdd).withArguments(10.0, 6.0).thenReturn(106.0);
    test:assertEquals(floatAdd(10.0, 6.0), 106.0);
    test:assertEquals(floatAdd(10, 5), 10.5);
}
