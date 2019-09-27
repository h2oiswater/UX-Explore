import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starter/bloc/api.dart';
import 'package:starter/core/bussiness/user_info.dart';
import 'package:starter/model/batch/batch.dart';
import 'package:starter/model/passenger.dart';
import 'package:starter/route/routes.dart';
import 'package:starter/ui/widgets/batch_info_widget.dart';
import 'package:starter/ui/widgets/passenger_selector_widget.dart';

class UserInfoBloc with ChangeNotifier {
  BuildContext context;
  List<Passenger> passengers = [];

  APIProvider api;

  UserInfoBloc() {
//    UserInfoRepository.getPassengers().then((result) {
//      List list = result.data["data"];
//      passengers = list.map((f) => Passenger.fromJsonMap(f)).toList();
//    });
  }

  Future<List<Passenger>> showPassengerSelector(int count) async {
    print('showPassengerSelector');
    var rep = await api
        .getTripAPI(context: context)
        .userInfoRepository
        .getPassengers();
    List list = rep.data["data"];
    passengers = list.map((f) => Passenger.fromJsonMap(f)).toList();

    return showModalBottomSheet<List<Passenger>>(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
            body: PassengerSelectorWidget(
              count: count,
              passengers: passengers,
            ),
          );
        });
  }

  Future<bool> showBatchInfoConfirm(Batch batch) {
    return showModalBottomSheet<bool>(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
            body: BatchInfoWidget(batch),
          );
        });
  }
}
