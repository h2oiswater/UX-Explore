import 'package:dio/dio.dart';
import 'package:starter/core/api/base/option.dart';
import 'package:starter/core/api/trip_api.dart';

class AuthRepository {
  static Future<Response<dynamic>> login(
      String phone, String password) {
    return TripAPI.request(RequestOption(
        url: '/common/user/token',
        method: HttpMethod.GET,
        queryParams: {
          "password": password,
          "phone": phone,
          "grant_type": 'password'
        }));
  }
}
