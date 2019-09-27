import 'arr_ticket.dart';

class Ticket {
  String date;
  List<Arr_ticket> arr_ticket;
  int total_ticket;

  Ticket.fromJsonMap(Map<String, dynamic> map)
      : date = map["date"],
        arr_ticket = List<Arr_ticket>.from(
            map["arr_ticket"].map((it) => Arr_ticket.fromJsonMap(it))),
        total_ticket = map["total_ticket"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = date;
    data['arr_ticket'] = arr_ticket != null
        ? this.arr_ticket.map((v) => v.toJson()).toList()
        : null;
    data['total_ticket'] = total_ticket;
    return data;
  }
}
