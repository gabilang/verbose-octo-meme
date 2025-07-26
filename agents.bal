import ballerina/http;
import ballerinax/ai;

final ai:AzureOpenAiProvider _math_tutorModel = check new (serviceUrl, apiKey, deploymentId, apiVersion);
final ai:Agent _math_tutorAgent = check new (
    systemPrompt = {role: "", instructions: string ``}, model = _math_tutorModel, tools = [getSum, getMulti]
);
