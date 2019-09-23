import 'package:dio/dio.dart';
import 'package:starter/core/api/base/ihttp_client.dart';
import 'package:starter/core/api/base/option.dart';
import 'package:starter/core/storage.dart';
import 'package:starter/model/api_error.dart';

import 'config.dart';

class TripAPI {
  static IHttpClient _client = HttpClient();

  static Future<Response<dynamic>> request(RequestOption option,
      {bool auth = false}) async {
    option.url = _getUrl(option.url);
    String token = await Storage().get(Storage.KEY_TOKEN);

    print('token = $token');

    option.queryParams['token'] = token;

    var response = await _client.request(option);

    if (response.data != null && response.data["code"] != 0) {
      print('eee');
      throw APIError(
          message: response.data["msg"], code: response.data["code"]);
    }
    return response;
  }

  static _getUrl(String url) => BASE_TRIP_URL + url;
}
