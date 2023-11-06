import 'package:dio/dio.dart';

import '../../../helpers/constants.dart';

import '../../../local_storage/local_storage.dart';

import '../../../../modules/core/auth/auth_store.dart';

class AuthAccessTokenInterceptor extends Interceptor {
  final LocalStorage _localStorage;
  final AuthStore _authStore;

  AuthAccessTokenInterceptor({
    required LocalStorage localStorage,
    required AuthStore authStore,
  })  : _localStorage = localStorage,
        _authStore = authStore;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authRequired =
        options.extra[Constants.restClientAuthRequiredKey] ?? false;

    if (authRequired) {
      final accessToken = await _localStorage
          .read<String>(Constants.localStorageAccessTokenKey);
      if (accessToken == null) {
        await _authStore.logout();
        return handler.reject(DioException(
          requestOptions: options,
          error: 'Token Expirado',
          type: DioExceptionType.cancel,
        ));
      }
      options.headers['Authorization'] = accessToken;
    } else {
      options.headers.remove('Authorization');
    }
    handler.next(options);
  }
}
