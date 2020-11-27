import ballerina/test;

// Mock Function definitions

@test:Mock {
    functionName : "intAdd"
}
test:MockFunction mock_intAdd = new();

@test:Mock {
    functionName : "stringAdd"
}
test:MockFunction mock_stringAdd = new();

@test:Mock {
    functionName: "floatAdd"
}
test:MockFunction mock_floatAdd = new();

@test:Mock {
    functionName : "intAddMultiple"
}
test:MockFunction mock_intAddMultiple = new();

