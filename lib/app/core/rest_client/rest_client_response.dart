class RestClientResponse<T> {
  T? data;
  int? statusCode;
  String? message;
  String? token;

  RestClientResponse({this.data, this.statusCode, this.message, this.token});
}
