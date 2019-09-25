import 'fields.dart';

class DiagnosticInfo {
  Fields fields;

  DiagnosticInfo.fromJsonMap(Map<String, dynamic> map) {
    if (map == null || map.isEmpty) return;
    this.fields = Fields.fromJsonMap(map["fields"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fields'] = fields == null ? null : fields.toJson();
    return data;
  }
}
