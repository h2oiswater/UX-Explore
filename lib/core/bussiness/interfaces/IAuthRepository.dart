import 'package:dio/dio.dart';
import 'package:starter/core/api/trip_api.dart';

abstract class IAuthRepository {
  TripAPI tripAPI;
  IAuthRepository(this.tripAPI);

  Future<Response<dynamic>> login(
      String phone, String password);
}