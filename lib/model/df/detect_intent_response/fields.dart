import 'time.dart';
import 'count.dart';
import 'date.dart';
import 'destination.dart';
import 'origin.dart';

class Fields {

  Count count;
  Origin origin;
  Time time;
  Date date;
  Destination destination;

	Fields.fromJsonMap(Map<String, dynamic> map): 
		count = Count.fromJsonMap(map["count"]),
		origin = Origin.fromJsonMap(map["origin"]),
		time = Time.fromJsonMap(map["time"]),
		date = Date.fromJsonMap(map["date"]),
		destination = Destination.fromJsonMap(map["destination"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = count == null ? null : count.toJson();
		data['origin'] = origin == null ? null : origin.toJson();
		data['time'] = time == null ? null : time.toJson();
		data['date'] = date == null ? null : date.toJson();
		data['destination'] = destination == null ? null : destination.toJson();
		return data;
	}
}
