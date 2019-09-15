import 'package:flutter/material.dart';
import 'package:starter/bloc/interfaces/trip.dart';
import 'package:starter/model/trip.dart';
import 'package:starter/ui/pages/main/voice_input_dev.dart';

import 'msg_list_widget.dart';

class MainPage extends StatelessWidget implements ITripView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Expanded(child: MsgListWidget()),
                VoiceInputWidget()
              ],
            )),
      ),
    );
  }

  @override
  void showPassengersSelector(
      BuildContext context, List<Passenger> passengers) {}
}
