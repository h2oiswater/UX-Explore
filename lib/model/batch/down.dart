class Down {
  int id;
  int area_id;
  int bus_line_id;
  double lat;
  double lng;
  String place;
  int time;
  double price;
  String type;
  int seq;
  int status;
  String create_date;
  String status_date;
  Object area_restriction;
  String p_area_name;
  int p_area_id;

  Down.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        area_id = map["area_id"],
        bus_line_id = map["bus_line_id"],
        lat = map["lat"],
        lng = map["lng"],
        place = map["place"],
        time = map["time"],
        price = map["price"],
        type = map["type"],
        seq = map["seq"],
        status = map["status"],
        create_date = map["create_date"],
        status_date = map["status_date"],
        area_restriction = map["area_restriction"],
        p_area_name = map["p_area_name"],
        p_area_id = map["p_area_id"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['area_id'] = area_id;
    data['bus_line_id'] = bus_line_id;
    data['lat'] = lat;
    data['lng'] = lng;
    data['place'] = place;
    data['time'] = time;
    data['price'] = price;
    data['type'] = type;
    data['seq'] = seq;
    data['status'] = status;
    data['create_date'] = create_date;
    data['status_date'] = status_date;
    data['area_restriction'] = area_restriction;
    data['p_area_name'] = p_area_name;
    data['p_area_id'] = p_area_id;
    return data;
  }
}
