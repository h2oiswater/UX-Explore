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

  @override
  Future<Response<dynamic>> fetchBatchInfo(Map<String, dynamic> params) {
    return tripAPI.request(RequestOption(
        url: '/user/busline/info/piece/batch/nlp',
        method: HttpMethod.POST,
        bodyParams: params));
  }

  @override
  Future<Response> createOrder(Map<String, dynamic> params) {
    return tripAPI.request(RequestOption(
        url: '/user/busline/order/create/piece',
        method: HttpMethod.POST,
        bodyParams: params));
  }

  @override
  Future<Response> fetchSeats(String busLineBatchId) {
    return tripAPI.request(RequestOption(
        url: '/user/busline/list/piece/seats',
        method: HttpMethod.POST,
        bodyParams: {"bus_line_batch_id": busLineBatchId}));
  }
}
