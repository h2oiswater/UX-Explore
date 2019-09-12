import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/bloc/interfaces/trip.dart';
import 'package:starter/bloc/trip.dart';
import 'package:starter/model/trip.dart';

import 'package:starter/ui/pages/main/voice_input.dart';

import 'msg_list_widget.dart';

class MainPage extends StatelessWidget implements ITripView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Provider(
          builder: (context) => TripBloc(context: context, tripView: this),
          dispose: (_, TripBloc bloc) => bloc.dispose(),
          child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Expanded(child: MsgListWidget()),
                  VoiceInputWidget()
                ],
              )),
        ),
      ),
    );
  }

  @override
  void showPassengersSelector(
      BuildContext context, List<Passenger> passengers) {
  }
}
