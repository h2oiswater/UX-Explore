import 'seat.dart';

class SeatRep {
  int code;
  String msg;
  List<Seat> data;

  SeatRep.fromJsonMap(Map<String, dynamic> map)
      : code = map["code"],
        msg = map["msg"],
        data = List<Seat>.from(map["data"].map((it) => Seat.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['msg'] = msg;
    data['data'] =
        data != null ? this.data.map((v) => v.toJson()).toList() : null;
    return data;
  }
}
