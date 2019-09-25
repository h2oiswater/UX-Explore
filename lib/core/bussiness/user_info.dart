import 'package:dio/dio.dart';
import 'package:starter/core/api/base/option.dart';
import 'package:starter/core/api/trip_api.dart';
import 'package:starter/core/bussiness/interfaces/IUserInfoRepository.dart';

class UserInfoRepository extends IUserInfoRepository {
  UserInfoRepository(TripAPI tripAPI) : super(tripAPI);

  Future<Response<dynamic>> getPassengers() {
    return tripAPI.request(RequestOption(
      url: '/user/user_linkman/list',
      method: HttpMethod.GET,
    ));
  }
}
