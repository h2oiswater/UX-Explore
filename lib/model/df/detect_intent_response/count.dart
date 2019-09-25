class Count {
  int numberValue;
  String kind;

  Count.fromJsonMap(Map<String, dynamic> map) {
    if (map == null || map.isEmpty) return;
    numberValue = map["numberValue"];
    kind = map["kind"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numberValue'] = numberValue;
    data['kind'] = kind;
    return data;
  }
}
