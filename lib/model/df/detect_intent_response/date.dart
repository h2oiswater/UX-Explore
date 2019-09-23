
class Date {

  String stringValue;
  String kind;

	Date.fromJsonMap(Map<String, dynamic> map): 
		stringValue = map["stringValue"],
		kind = map["kind"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['stringValue'] = stringValue;
		data['kind'] = kind;
		return data;
	}
}
