import 'package:flutter/material.dart';

class AuthBloc with ChangeNotifier {
  bool _needLogin = false;

  bool get shouldNavigateToLoginPage => _needLogin;

  void logout() {
    print("logout");
    _needLogin = true;
    notifyListeners();
  }

  void zzz() => _needLogin = false;
}
