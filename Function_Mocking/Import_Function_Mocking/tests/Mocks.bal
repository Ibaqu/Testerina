// import ballerina/math;
import ballerina/test;

@test:Mock {
    moduleName : "ballerina/math",
    functionName : "absInt"
}
test:MockFunction mock_absInt = new();

@test:Mock {
    moduleName: "ballerina/io",
    functionName: "print"
}
test:MockFunction mock_print = new();