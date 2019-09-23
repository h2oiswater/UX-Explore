
class Text {

  List<String> text;

	Text.fromJsonMap(Map<String, dynamic> map): 
		text = List<String>.from(map["text"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['text'] = text;
		return data;
	}
}
