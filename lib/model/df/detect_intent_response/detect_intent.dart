import 'package:starter/model/df/detect_intent_response/parameters.dart';

import 'diagnostic_info.dart';
import 'fulfillment_messages.dart';
import 'intent.dart';

class DetectIntent {

  List<FulfillmentMessages> fulfillmentMessages;
  List<Object> outputContexts;
  String queryText;
  int speechRecognitionConfidence;
  String action;
  Parameters parameters;
  bool allRequiredParamsPresent;
  String fulfillmentText;
  String webhookSource;
  Object webhookPayload;
  Intent intent;
  double intentDetectionConfidence;
  DiagnosticInfo diagnosticInfo;
  String languageCode;
  Object sentimentAnalysisResult;

	DetectIntent.fromJsonMap(Map<String, dynamic> map): 
		fulfillmentMessages = List<FulfillmentMessages>.from(map["fulfillmentMessages"].map((it) => FulfillmentMessages.fromJsonMap(it))),
		outputContexts = map["outputContexts"],
		queryText = map["queryText"],
		speechRecognitionConfidence = map["speechRecognitionConfidence"],
		action = map["action"],
		parameters = Parameters.fromJsonMap(map["parameters"]),
		allRequiredParamsPresent = map["allRequiredParamsPresent"],
		fulfillmentText = map["fulfillmentText"],
		webhookSource = map["webhookSource"],
		webhookPayload = map["webhookPayload"],
		intent = Intent.fromJsonMap(map["intent"]),
		intentDetectionConfidence = map["intentDetectionConfidence"],
		diagnosticInfo = DiagnosticInfo.fromJsonMap(map["diagnosticInfo"]),
		languageCode = map["languageCode"],
		sentimentAnalysisResult = map["sentimentAnalysisResult"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['fulfillmentMessages'] = fulfillmentMessages != null ? 
			this.fulfillmentMessages.map((v) => v.toJson()).toList()
			: null;
		data['outputContexts'] = outputContexts;
		data['queryText'] = queryText;
		data['speechRecognitionConfidence'] = speechRecognitionConfidence;
		data['action'] = action;
		data['parameters'] = parameters == null ? null : parameters.toJson();
		data['allRequiredParamsPresent'] = allRequiredParamsPresent;
		data['fulfillmentText'] = fulfillmentText;
		data['webhookSource'] = webhookSource;
		data['webhookPayload'] = webhookPayload;
		data['intent'] = intent == null ? null : intent.toJson();
		data['intentDetectionConfidence'] = intentDetectionConfidence;
		data['diagnosticInfo'] = diagnosticInfo == null ? null : diagnosticInfo.toJson();
		data['languageCode'] = languageCode;
		data['sentimentAnalysisResult'] = sentimentAnalysisResult;
		return data;
	}
}
