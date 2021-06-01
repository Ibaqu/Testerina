import ballerina/test;
import ballerina/email;

@test:Config {}
function testSendNotification() {
    string[] emailIds = ["user1@test.com", "user2@test.com"];

    // Create a default mock SMTP client and assign it to the `smtpClient` object.
    smtpClient = test:mock(email:SmtpClient);

    // Stub to do nothing when the`send` function is invoked.
    test:prepare(smtpClient).when("sendMessage").doNothing();

    // Invoke the function to test and verify that no error occurred.
    test:assertEquals(sendNotification(emailIds), ());
}