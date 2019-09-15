import 'package:flutter/material.dart';
import 'package:starter/bloc/interfaces/trip.dart';
import 'package:starter/model/trip.dart';

class TripBloc with ChangeNotifier implements ITripBloc {
  BuildContext context;
  final ITripView tripView;

  int count = 0;

  TripBloc({this.context, this.tripView});

  @override
  void dispose() {
    context = null;
    super.dispose();
  }

  @override
  Future<List<Passenger>> getPassengers({bool showSelector}) {
    return null;
  }

  @override
  void addCount() {
    count++;
    notifyListeners();
  }
}
