import 'package:flutter/cupertino.dart';
import 'package:starter/core/api/df_api.dart';
import 'package:starter/core/api/trip_api.dart';

class APIProvider {
  final BuildContext context;

  DFAPI dfAPI;
  TripAPI tripAPI;
  APIProvider({this.context}){
    dfAPI = DFAPI();
    tripAPI = TripAPI();
  }
}