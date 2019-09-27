class Line {
  int id;
  String name;
  String description;
  int start_area_id;
  int end_area_id;
  int miles;
  double hours;
  int type;
  int place_type;
  int point_type;
  String start_plan;
  int seats;
  int status;
  String company_id;
  String create_date;
  String status_date;
  int back_line_id;
  int sort;
  int premium;
  bool is_need_bind;
  bool is_open_third;
  bool is_sell;
  String start_area_name;
  String end_area_name;

  Line.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        description = map["description"],
        start_area_id = map["start_area_id"],
        end_area_id = map["end_area_id"],
        miles = map["miles"],
        hours = map["hours"],
        type = map["type"],
        place_type = map["place_type"],
        point_type = map["point_type"],
        start_plan = map["start_plan"],
        seats = map["seats"],
        status = map["status"],
        company_id = map["company_id"],
        create_date = map["create_date"],
        status_date = map["status_date"],
        back_line_id = map["back_line_id"],
        sort = map["sort"],
        premium = map["premium"],
        is_need_bind = map["is_need_bind"],
        is_open_third = map["is_open_third"],
        is_sell = map["is_sell"],
        start_area_name = map["start_area_name"],
        end_area_name = map["end_area_name"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['start_area_id'] = start_area_id;
    data['end_area_id'] = end_area_id;
    data['miles'] = miles;
    data['hours'] = hours;
    data['type'] = type;
    data['place_type'] = place_type;
    data['point_type'] = point_type;
    data['start_plan'] = start_plan;
    data['seats'] = seats;
    data['status'] = status;
    data['company_id'] = company_id;
    data['create_date'] = create_date;
    data['status_date'] = status_date;
    data['back_line_id'] = back_line_id;
    data['sort'] = sort;
    data['premium'] = premium;
    data['is_need_bind'] = is_need_bind;
    data['is_open_third'] = is_open_third;
    data['is_sell'] = is_sell;
    data['start_area_name'] = start_area_name;
    data['end_area_name'] = end_area_name;
    return data;
  }
}
