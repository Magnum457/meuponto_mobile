import 'package:dio/dio.dart';

import '../../../helpers/constants.dart';

class SecretFacialValidatorApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final apiSecretRequired =
        options.extra[Constants.apiFacialValidationRequiredKey] ?? false;

    if (options.headers['Authorization'] == null) {
      if (apiSecretRequired) {
        options.headers['Authorization'] =
            "Bearer ${Constants.secretFacialValidatorApi}";
      } else {
        options.headers.remove('Authorization');
      }
    }

    handler.next(options);
  }
}
