import 'text.dart';

class FulfillmentMessages {

  String platform;
  Text text;
  String message;

	FulfillmentMessages.fromJsonMap(Map<String, dynamic> map): 
		platform = map["platform"],
		text = Text.fromJsonMap(map["text"]),
		message = map["message"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['platform'] = platform;
		data['text'] = text == null ? null : text.toJson();
		data['message'] = message;
		return data;
	}
}
