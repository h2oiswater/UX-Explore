class APIError extends Error {
  String message;

  APIError({this.message});
}