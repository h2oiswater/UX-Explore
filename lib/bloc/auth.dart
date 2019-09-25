import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:starter/bloc/api.dart';
import 'package:starter/core/storage.dart';
import 'package:starter/utils/crypto.dart';

class AuthBloc with ChangeNotifier {
  String _phone;
  String _password;
  bool _needLogin = false;

  bool isAuthenticated = false;

  APIProvider api;

  final formKey = GlobalKey<FormState>();

  AuthBloc() {
    Storage().get(Storage.KEY_TOKEN).then((token) {
      print("app token = $token");
      this.isAuthenticated = token != null ? token.isNotEmpty : false;
      print("app this.isAuthenticated = ${this.isAuthenticated}");
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
    rep = await api.getTripAPI().authRepository.login(_phone, _password);

    String token = rep.data["data"]["token"];
    Storage().set(Storage.KEY_TOKEN, token);
    return null;
  }

  void zzz() => _needLogin = false;
}
