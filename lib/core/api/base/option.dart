import 'dart:io';

enum HttpMethod { GET, POST, PUT, PATCH, DELETE }

class RequestOption {
  String url;
  final HttpMethod method;
  Map<String, String> headers;
  Map<String, dynamic> queryParams;
  Map<String, String> bodyParams;
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
}
