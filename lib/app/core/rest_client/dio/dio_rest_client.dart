import 'package:dio/dio.dart';
import 'package:meuponto_mobile/app/core/rest_client/dio/interceptors/auth_access_token_interceptor.dart';

import '../../helpers/constants.dart';
import '../../exceptions/rest_client_exception.dart';

import '../../logger/app_logger.dart';
import '../../local_storage/local_storage.dart';

import '../rest_client.dart';
import '../rest_client_response.dart';

import '../../../modules/core/auth/auth_store.dart';

class DioRestClient implements RestClient {
  late final Dio _dio;
  final _defaultOptions = BaseOptions(
    baseUrl: Constants.envBaseUrl,
    connectTimeout:
        const Duration(milliseconds: Constants.restClientConnectTimeout),
    receiveTimeout:
        const Duration(milliseconds: Constants.restClientReceiveTimeout),
  );
  final _identidadeOptions = BaseOptions(
    baseUrl: Constants.urlIdentidadeAPI,
    connectTimeout:
        const Duration(milliseconds: Constants.restClientConnectTimeout),
    receiveTimeout:
        const Duration(milliseconds: Constants.restClientReceiveTimeout),
  );

  DioRestClient({
    required LocalStorage localStorage,
    required AppLogger log,
    required AuthStore authStore,
    BaseOptions? options,
  }) {
    _dio = Dio(options ?? _defaultOptions);
    _dio.interceptors.addAll([
      AuthAccessTokenInterceptor(
          localStorage: localStorage, authStore: authStore),
    ]);
  }

  @override
  RestClient auth() {
    _defaultOptions.extra[Constants.restClientAuthRequiredKey] = true;
    _identidadeOptions.extra[Constants.restClientAuthRequiredKey] = true;
    return this;
  }

  @override
  RestClient unauth() {
    _defaultOptions.extra[Constants.restClientAuthRequiredKey] = false;
    _identidadeOptions.extra[Constants.restClientAuthRequiredKey] = false;
    return this;
  }

  @override
  Future<RestClientResponse<T>> userData<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      _dio.options = _identidadeOptions;
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      throw _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      throw _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(path,
          queryParameters: queryParameters, options: Options(headers: headers));
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      throw _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      throw _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      throw _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      throw _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path,
      {String? method,
      data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.request(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers, method: method));
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      throw _throwRestClientException(e);
    }
  }

  Future<RestClientResponse<T>> _dioResponseConverter<T>(
      Response<dynamic> response) async {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      message: response.statusMessage,
      token: response.headers['authorization']?.first ?? '',
    );
  }

  Never _throwRestClientException(DioException e) {
    throw RestClientException(
      message: e.message,
      statusCode: e.response?.statusCode,
      error: e.error,
      response: RestClientResponse(
        data: e.response?.data,
        statusCode: e.response?.statusCode,
        message: e.response?.statusMessage,
        token: e.response?.headers['authorization']?.first ?? '',
      ),
    );
  }
}
