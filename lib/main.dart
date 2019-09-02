import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:starter/bloc/auth.dart';
import 'package:starter/ui/pages/main/main.dart';


void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;

    return ChangeNotifierProvider<AuthBloc>.value(
      value: AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Code Sample for Navigator',
        home: MainPage(),
      ),
    );
  }
}