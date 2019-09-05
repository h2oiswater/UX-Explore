

enum HttpMethod {
  GET,
  POST,
  PUT,
  PATCH,
  DELETE
}

class RequestOption {
  String url;
  HttpMethod method;
  Map<String, String> headers;
}
