import 'data.dart';

class Batch {
  int code;
  String msg;
  Data data;

  Batch.fromJsonMap(Map<String, dynamic> map)
      : code = map["code"],
        msg = map["msg"],
        data = Data.fromJsonMap(map["data"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = new Map<String, dynamic>();
    jsonData['code'] = code;
    jsonData['msg'] = msg;
    jsonData['data'] = data == null ? null : data.toJson();
    return jsonData;
  }
}
