import 'package:flutter/cupertino.dart';
import 'package:starter/core/api/df_api.dart';
import 'package:starter/core/api/trip_api.dart';

class APIProvider {
  DFAPI dfAPI;
  TripAPI _tripAPI;

  TripAPI getTripAPI({BuildContext context}) {
    _tripAPI.context = context;
    return _tripAPI;
  }

  APIProvider() {
    dfAPI = DFAPI();
    _tripAPI = TripAPI();
  }
}
