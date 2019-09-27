import 'dart:io';

enum HttpMethod { GET, POST, PUT, PATCH, DELETE, DOWNLOAD }

class RequestOption {
  String url;
  final HttpMethod method;
  Map<String, String> headers;
  Map<String, dynamic> queryParams;
  Map<String, dynamic> bodyParams;
  List<File> fileParams;

  RequestOption(
      {this.url, this.method, this.headers, this.queryParams, this.bodyParams, this.fileParams}){
    if (headers == null) {
      headers = {};
    }
    if (queryParams == null) {
      queryParams = {};
    }
    if (bodyParams == null) {
      bodyParams = {};
    }
    if (fileParams == null) {
      fileParams = [];
    }
  }

  getQueryUrl() {
    if (queryParams == null || queryParams.isEmpty) {
      return url;
    }

    var result = url;
    result = result + "?";
    queryParams.forEach((key, value) {
      if (result.endsWith("?")) {
        result = result + key + "=" + value;
      } else {
        result = result + "&" + key + "=" + value;
      }
    });

    return result;
  }
}
