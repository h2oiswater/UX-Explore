import 'package:dio/dio.dart';
import 'package:starter/core/api/trip_api.dart';

abstract class IUserInfoRepository {
  TripAPI tripAPI;
  IUserInfoRepository(this.tripAPI);

  Future<Response<dynamic>>getPassengers();

  Future<Response<dynamic>> fetchBatchInfo(Map<String, dynamic> params);

  Future<Response<dynamic>> createOrder(Map<String, dynamic> params);

  Future<Response<dynamic>> fetchSeats(String busLineBatchId);
}