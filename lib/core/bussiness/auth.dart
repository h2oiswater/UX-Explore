import 'package:dio/dio.dart';
import 'package:starter/core/api/base/option.dart';
import 'package:starter/core/api/trip_api.dart';
import 'interfaces/IAuthRepository.dart';

class AuthRepository extends IAuthRepository {
  AuthRepository(TripAPI tripAPI) : super(tripAPI);

  Future<Response<dynamic>> login(String phone, String password) {
    return tripAPI.request(RequestOption(
        url: '/common/user/token',
        method: HttpMethod.GET,
        queryParams: {
          "password": password,
          "phone": phone,
          "grant_type": 'password'
        }));
  }
}
