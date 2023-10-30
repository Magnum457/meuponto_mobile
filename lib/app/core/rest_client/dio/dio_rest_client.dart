import 'package:dio/dio.dart';

import '../../../core/helpers/constants.dart';
import '../../exceptions/rest_client_exception.dart';

import '../rest_client.dart';
import '../rest_client_response.dart';

import '../../../core/logger/app_logger.dart';

class DioRestClient implements RestClient {
  late final Dio _dio;
  final _defaultOptions = BaseOptions(
    baseUrl: Constants.envBaseUrl,
    connectTimeout:
        const Duration(milliseconds: Constants.restClientConnectTimeout),
    receiveTimeout:
        const Duration(milliseconds: Constants.restClientReceiveTimeout),
  );

  DioRestClient({
    required AppLogger log,
    BaseOptions? options,
  }) {
    _dio = Dio(options ?? _defaultOptions);
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
