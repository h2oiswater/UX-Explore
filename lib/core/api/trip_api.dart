import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:starter/core/api/base/ihttp_client.dart';
import 'package:starter/core/api/base/option.dart';
import 'package:starter/core/bussiness/auth.dart';
import 'package:starter/core/bussiness/interfaces/IAuthRepository.dart';
import 'package:starter/core/bussiness/interfaces/IUserInfoRepository.dart';
import 'package:starter/core/bussiness/user_info.dart';
import 'package:starter/core/storage.dart';
import 'package:starter/model/api_error.dart';
import 'package:starter/route/routes.dart';

import 'config.dart';

class TripAPI {
  static IHttpClient _client = HttpClient();

  IAuthRepository authRepository;
  IUserInfoRepository userInfoRepository;

  BuildContext context;

  TripAPI() {
    authRepository = AuthRepository(this);
    userInfoRepository = UserInfoRepository(this);
  }

  Future<Response<dynamic>> request(RequestOption option,
      {bool auth = false}) async {
    option.url = _getUrl(option.url);
    String token = await Storage().get(Storage.KEY_TOKEN);

    print('token = $token');

    option.queryParams['token'] = token;

    var response = await _client.request(option);

    if (response.data != null && response.data["code"] != 0) {
      if (response.data["code"] == 918 && context != null) {
        Navigator.of(context).pushReplacementNamed(LOGIN_PAGE);
      }

      throw APIError(
          message: response.data["msg"], code: response.data["code"]);
    }
    return response;
  }

  static _getUrl(String url) => BASE_TRIP_URL + url;
}
