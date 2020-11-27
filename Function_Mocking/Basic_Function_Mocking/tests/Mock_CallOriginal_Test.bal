import ballerina/test;

@test:Config {
    dependsOn : ["Mock_call_DifferentTypes"]
}
public function Mock_callOriginal_DifferentTypes() {
    // IntAdd
    test:when(mock_intAdd).callOriginal();
    test:assertEquals(intAdd(10, 6), 16);
    test:assertEquals(callIntAdd(10, 6), 16);

    // StringAdd
    test:when(mock_stringAdd).callOriginal();
    test:assertEquals(stringAdd("Ibaqu"), "test_Ibaqu");

    // FloatAdd
    test:when(mock_floatAdd).callOriginal();
    test:assertEquals(floatAdd(10.6, 4.5), 15.1);
}
