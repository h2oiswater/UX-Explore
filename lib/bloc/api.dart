import 'package:flutter/cupertino.dart';
import 'package:starter/core/api/df_api.dart';
import 'package:starter/core/api/trip_api.dart';

class APIProvider {
  DFAPI dfAPI;
  TripAPI _tripAPI;

  getTripAPI({BuildContext context}) => _tripAPI.context = context ;

  APIProvider(){
    dfAPI = DFAPI();
    _tripAPI = TripAPI();
  }
}