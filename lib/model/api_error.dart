class APIError extends Error {
  String message;
  int code;

  APIError({this.message, this.code});
}