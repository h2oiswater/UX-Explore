import 'package:dio/dio.dart';
import 'package:starter/core/api/base/option.dart';
import 'package:starter/core/api/trip_api.dart';

class UserInfoRepository {
  static Future<Response<dynamic>>getPassengers() {
    return TripAPI.request(RequestOption(
        url: '/user/user_linkman/list',
        method: HttpMethod.GET,));
    }
}
