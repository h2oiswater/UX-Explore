import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/bloc/api.dart';
import 'package:starter/bloc/auth.dart';
import 'package:starter/bloc/conversation.dart';
import 'package:starter/bloc/user_info.dart';
import 'package:starter/route/routes.dart';
import 'package:starter/ui/pages/login/login_page.dart';
import 'package:starter/ui/pages/main/main_page.dart';
import 'package:starter/ui/pages/welcome/welcome_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;

    return MultiProvider(
      providers: [Provider.value(value: APIProvider())],
      child: MaterialApp(
        title: 'ReeMii',
        initialRoute: WELCOME_PAGE,
        routes: {
          WELCOME_PAGE: (context) => WelcomePage(),
          LOGIN_PAGE: (context) => LoginPage(),
          MAIN_PAGE: (context) => MainPage()
        },
      ),
    );
  }
}
