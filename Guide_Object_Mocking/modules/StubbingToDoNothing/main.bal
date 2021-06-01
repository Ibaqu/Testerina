import ballerina/email;

email:SmtpClient smtpClient = check new ("localhost", "admin","admin");

// This function sends out emails to specified email addresses and returns an error if sending failed.
function sendNotification(string[] emailIds) returns error? {
    email:Message msg = {
        'from: "builder@abc.com",
        subject: "Error Alert ...",
        to: emailIds,
        body: ""
    };
    return check smtpClient->sendMessage(msg);
}