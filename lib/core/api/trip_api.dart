import 'package:starter/core/api/base/ihttp_client.dart';
import 'package:starter/core/api/base/option.dart';
import 'config.dart';

class TripAPI {
  static IHttpClient _client = HttpClient();

  static Future<dynamic> request(RequestOption option) {
    option.url = _getUrl(option.url);
    return _client.request(option);
  }

  static _getUrl(String url) => BASE_TRIP_URL + url;
}
