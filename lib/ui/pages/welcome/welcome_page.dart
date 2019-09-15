import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/bloc/auth.dart';
import 'package:starter/ui/pages/login/login_page.dart';
import 'package:starter/ui/pages/main/main_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthBloc>(
      builder: (_, bloc, __) {
        if (bloc.isAuthenticated) {
          return MainPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
