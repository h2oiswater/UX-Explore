import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:starter/core/bussiness/auth.dart';
import 'package:starter/core/storage.dart';
import 'package:starter/model/api_error.dart';
import 'package:starter/utils/crypto.dart';

class AuthBloc with ChangeNotifier {
  String _phone;
  String _password;
  bool _needLogin = false;

  bool isAuthenticated = false;

  AuthBloc() {
    Storage().get(Storage.KEY_TOKEN).then((token) {
      this.isAuthenticated = token != null ? token.isNotEmpty : false;
      notifyListeners();
    });
  }

  set password(value) {
    _password = generateMd5(value);
  }

  set phone(value) {
    _phone = value;
  }

  bool get shouldNavigateToLoginPage => _needLogin;

  void logout() {
    print("logout");
    _needLogin = true;
    notifyListeners();
  }

  Future<String> login() async {
    Response<Map<String, dynamic>> rep;
    try {
      rep = await AuthRepository.login(_phone, _password);
    } catch (_) {
      return 'error';
    }

    if (rep.data["code"] == -1) {
      throw APIError(message: rep.data["msg"]);
    }

    String token = rep.data["data"]["token"];
    Storage().set(Storage.KEY_TOKEN, token);
    return token;
  }

  void zzz() => _needLogin = false;
}
