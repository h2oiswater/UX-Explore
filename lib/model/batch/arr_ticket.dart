class Arr_ticket {
  String bus_line_batch_id;
  String car_model;
  double min_price;
  int count;
  String time;

  Arr_ticket.fromJsonMap(Map<String, dynamic> map)
      : bus_line_batch_id = map["bus_line_batch_id"],
        car_model = map["car_model"],
        min_price = map["min_price"],
        count = map["count"],
        time = map["time"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bus_line_batch_id'] = bus_line_batch_id;
    data['car_model'] = car_model;
    data['min_price'] = min_price;
    data['count'] = count;
    data['time'] = time;
    return data;
  }
}
