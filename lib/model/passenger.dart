class Passenger {
  int id;
  String name;
  String phone;
  String idCardType;
  String idCard;
  String userId;
  String createDate;

  Passenger();

  Passenger.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        phone = map["phone"],
        idCardType = map["id_card_type"],
        idCard = map["id_card"],
        userId = map["user_id"],
        createDate = map["create_date"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['id_card_type'] = idCardType;
    data['id_card'] = idCard;
    data['user_id'] = userId;
    data['create_date'] = createDate;
    return data;
  }
}
