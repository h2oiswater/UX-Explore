import 'package:flutter/widgets.dart';
import 'package:starter/model/trip.dart';

abstract class ITripBloc {
  Future<List<Passenger>> getPassengers({bool showSelector});
}

abstract class ITripView {
  void showPassengersSelector(
      BuildContext context, List<Passenger> passengers);
}