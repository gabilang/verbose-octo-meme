import ballerina/http;
import ballerinax/ai;

listener ai:Listener math_tutorListener = new (listenOn = check http:getDefaultListener());

service /math_tutor on math_tutorListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {

        string stringResult = check _math_tutorAgent->run(request.message, request.sessionId);
        return {message: stringResult};
    }
}
