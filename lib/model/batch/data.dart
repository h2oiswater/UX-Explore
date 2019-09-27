import 'down.dart';
import 'line.dart';
import 'ticket.dart';
import 'up.dart';

class Data {
  List<Ticket> ticket;
  Line line;
  List<Up> up;
  List<Down> down;

  Data.fromJsonMap(Map<String, dynamic> map)
      : ticket = List<Ticket>.from(
            map["ticket"].map((it) => Ticket.fromJsonMap(it))),
        line = Line.fromJsonMap(map["line"]),
        up = List<Up>.from(map["up"].map((it) => Up.fromJsonMap(it))),
        down = List<Down>.from(map["down"].map((it) => Down.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket'] =
        ticket != null ? this.ticket.map((v) => v.toJson()).toList() : null;
    data['line'] = line == null ? null : line.toJson();
    data['up'] = up != null ? this.up.map((v) => v.toJson()).toList() : null;
    data['down'] =
        down != null ? this.down.map((v) => v.toJson()).toList() : null;
    return data;
  }
}
