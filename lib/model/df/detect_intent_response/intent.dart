
class Intent {

  List<Object> inputContextNames;
  List<Object> events;
  List<Object> trainingPhrases;
  List<Object> outputContexts;
  List<Object> parameters;
  List<Object> messages;
  List<Object> defaultResponsePlatforms;
  List<Object> followupIntentInfo;
  String name;
  String displayName;
  int priority;
  bool isFallback;
  String webhookState;
  String action;
  bool resetContexts;
  String rootFollowupIntentName;
  String parentFollowupIntentName;
  bool mlDisabled;

	Intent.fromJsonMap(Map<String, dynamic> map): 
		inputContextNames = map["inputContextNames"],
		events = map["events"],
		trainingPhrases = map["trainingPhrases"],
		outputContexts = map["outputContexts"],
		parameters = map["parameters"],
		messages = map["messages"],
		defaultResponsePlatforms = map["defaultResponsePlatforms"],
		followupIntentInfo = map["followupIntentInfo"],
		name = map["name"],
		displayName = map["displayName"],
		priority = map["priority"],
		isFallback = map["isFallback"],
		webhookState = map["webhookState"],
		action = map["action"],
		resetContexts = map["resetContexts"],
		rootFollowupIntentName = map["rootFollowupIntentName"],
		parentFollowupIntentName = map["parentFollowupIntentName"],
		mlDisabled = map["mlDisabled"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['inputContextNames'] = inputContextNames;
		data['events'] = events;
		data['trainingPhrases'] = trainingPhrases;
		data['outputContexts'] = outputContexts;
		data['parameters'] = parameters;
		data['messages'] = messages;
		data['defaultResponsePlatforms'] = defaultResponsePlatforms;
		data['followupIntentInfo'] = followupIntentInfo;
		data['name'] = name;
		data['displayName'] = displayName;
		data['priority'] = priority;
		data['isFallback'] = isFallback;
		data['webhookState'] = webhookState;
		data['action'] = action;
		data['resetContexts'] = resetContexts;
		data['rootFollowupIntentName'] = rootFollowupIntentName;
		data['parentFollowupIntentName'] = parentFollowupIntentName;
		data['mlDisabled'] = mlDisabled;
		return data;
	}
}
