import 'dart:convert';
import 'package:dio/dio.dart';

import '../../core/helpers/constants.dart';
import '../../core/local_storage/local_storage.dart';
import 'session_service.dart';

class SessionServiceImpl implements SessionService {
  final LocalStorage _localStorage;

  SessionServiceImpl({required LocalStorage localStorage})
      : _localStorage = localStorage;

  @override
  Future<void> initializeSession(dynamic cookie) async {
    await _saveCookieIdentidadeInSession(cookie);
  }

  Future<void> _saveCookieIdentidadeInSession(dynamic cookie) async {
    await _localStorage.write(Constants.identidadeSession, cookie.toString());
  }

  @override
  Future<String> getCookieIdentidadeInSession() async {
    final identidadeSession = await _localStorage.read<String>(
      Constants.identidadeSession,
    );
    return identidadeSession ?? '';
  }

  @override
  Future<void> closeSession() async {
    await _destroyAccessTokenInSessionAndInIdentidade();
    await _logoutIdentidade();
  }

  Future<void> _destroyAccessTokenInSessionAndInIdentidade() async {
    String? accessToken =
        await _localStorage.read<String>(Constants.localStorageAccessTokenKey);

    if (accessToken == null) {
      return;
    }

    try {
      final headers = {'content-type': 'application/json'};
      final Options options = Options(headers: headers);
      final data = jsonEncode({
        'client_id': Constants.identifierIdentidade,
        'client_secret': Constants.secretIdentidade,
        'token': accessToken,
      });
      final dio = Dio();
      await dio.post(
        '${Constants.urlIdentidadeAPI}/oauth/revoke',
        options: options,
        data: data,
      );
    } catch (e) {
      throw Exception(
          'Não foi possível revogar o AcessToken e encerrar a sessão.');
    }
  }

  Future<void> _logoutIdentidade() async {
    try {
      var headers = {
        "cookie": "_identidade_session=${await getCookieIdentidadeInSession()}"
      };
      final dio = Dio();
      await dio.get(
        '${Constants.urlIdentidadeAPI}/users/sign_out',
        options: Options(headers: headers),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
