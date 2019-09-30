class Seat {
  String bus_line_batch_id;
  int seat_num;
  double seat_price_original;
  double seat_price_discount;
  String status;
  Object order_bus_id;
  String create_date;
  String status_date;

  Seat.fromJsonMap(Map<String, dynamic> map)
      : bus_line_batch_id = map["bus_line_batch_id"],
        seat_num = map["seat_num"],
        seat_price_original = map["seat_price_original"],
        seat_price_discount = map["seat_price_discount"],
        status = map["status"],
        order_bus_id = map["order_bus_id"],
        create_date = map["create_date"],
        status_date = map["status_date"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bus_line_batch_id'] = bus_line_batch_id;
    data['seat_num'] = seat_num;
    data['seat_price_original'] = seat_price_original;
    data['seat_price_discount'] = seat_price_discount;
    data['status'] = status;
    data['order_bus_id'] = order_bus_id;
    data['create_date'] = create_date;
    data['status_date'] = status_date;
    return data;
  }
}
