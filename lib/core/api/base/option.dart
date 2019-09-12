import 'dart:io';

enum HttpMethod { GET, POST, PUT, PATCH, DELETE }

class RequestOption {
  String url;
  final HttpMethod method;
  final Map<String, String> headers;
  final Map<String, String> queryParams;
  final Map<String, String> bodyParams;
  final List<File> fileParams;

  RequestOption(
      {this.url, this.method, this.headers, this.queryParams, this.bodyParams, this.fileParams});
}
