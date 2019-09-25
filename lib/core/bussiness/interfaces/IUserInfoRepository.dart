import 'package:dio/dio.dart';
import 'package:starter/core/api/trip_api.dart';

abstract class IUserInfoRepository {
  TripAPI tripAPI;
  IUserInfoRepository(this.tripAPI);

  Future<Response<dynamic>>getPassengers();
}