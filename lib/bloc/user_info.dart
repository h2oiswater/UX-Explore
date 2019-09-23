import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/core/bussiness/user_info.dart';
import 'package:starter/model/passenger.dart';
import 'package:starter/ui/widgets/passenger_selector_widget.dart';

import 'app.dart';

class UserInfoBloc with ChangeNotifier {
  final BuildContext context;
  List<Passenger> passengers = [];

  UserInfoBloc({this.context}) {
//    UserInfoRepository.getPassengers().then((result) {
//      List list = result.data["data"];
//      passengers = list.map((f) => Passenger.fromJsonMap(f)).toList();
//    });
  }

  Future<List<Passenger>> showPassengerSelector(int count) {
    print('showPassengerSelector');
    return showModalBottomSheet<List<Passenger>>(
        context: APP.getContext(),
        builder: (BuildContext context) {
          return Scaffold(
            body: PassengerSelectorWidget(
              count: count,
              passengers: passengers,
            ),
          );
        });
  }
}
