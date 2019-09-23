import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:starter/bloc/app.dart';
import 'package:starter/route/routes.dart';
import 'package:starter/core/api/base/ihttp_client.dart';
import 'package:starter/core/api/base/option.dart';
import 'package:starter/core/storage.dart';
import 'package:starter/model/api_error.dart';
import 'config.dart';

class TripAPI {
  static IHttpClient _client = HttpClient();

  static Future<Response<dynamic>> request(RequestOption option, {bool auth = false}) async {
    option.url = _getUrl(option.url);
    String token = await Storage().get(Storage.KEY_TOKEN);

    print('token = $token');

    option.queryParams['token'] = token;

    var response = await _client.request(option);

    if (response.data != null && response.data["code"] != 0) {
      throw APIError(message: '用户登录过期', code: CODE_TOKEN_EXPIRED);
    }
    return response;
  }

  static _getUrl(String url) => BASE_TRIP_URL + url;
}
