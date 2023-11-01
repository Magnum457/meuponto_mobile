import 'package:dio/dio.dart';
import 'package:meuponto_mobile/app/core/helpers/constants.dart';
import 'package:meuponto_mobile/app/core/local_storage/local_storage.dart';

class AuthInterceptor extends Interceptor {
  final LocalStorage _localStorage;

  AuthInterceptor({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authRequired =
        options.extra[Constants.restClientAuthRequiredKey] ?? false;

    if (authRequired) {}
  }
}
