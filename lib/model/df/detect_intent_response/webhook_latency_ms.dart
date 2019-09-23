
class Webhook_latency_ms {

  int numberValue;
  String kind;

	Webhook_latency_ms.fromJsonMap(Map<String, dynamic> map): 
		numberValue = map["numberValue"],
		kind = map["kind"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['numberValue'] = numberValue;
		data['kind'] = kind;
		return data;
	}
}
