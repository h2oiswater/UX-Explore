import 'fields.dart';

class Parameters {

  Fields fields;

	Parameters.fromJsonMap(Map<String, dynamic> map): 
		fields = Fields.fromJsonMap(map["fields"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['fields'] = fields == null ? null : fields.toJson();
		return data;
	}
}
