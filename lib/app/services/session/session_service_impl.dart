import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

import '../../core/helpers/constants.dart';
import '../../core/local_storage/local_storage.dart';
import 'session_service.dart';

class SessionServiceImpl implements SessionService {
  final LocalStorage _localStorage;

  SessionServiceImpl({required LocalStorage localStorage})
      : _localStorage = localStorage;

  @override
  Future<void> saveCredentialClientInSession(oauth2.Client oauthClient) async {
    final String client = oauthClient.credentials.toJson();
    await _localStorage.write(Constants.clientSession, client);
  }

  @override
  Future<void> saveCookieIdentidadeInSession(cookie) async {
    await _localStorage.write(Constants.identidadeSession, cookie.toString());
  }

  @override
  Future<String?> getCredentialClientInSession() async {
    String? clientSession =
        await _localStorage.read<String>(Constants.clientSession);

    return clientSession;
  }

  @override
  Future<String?> getAccessTokenClientInSession() async {
    String? session = await getCredentialClientInSession();
    if (session != null) {
      var data = json.decode(session);
      if (data != null) {
        return data['accessToken'];
      }
    }
    return null;
  }

  @override
  Future<String> getCookieIdentidadeInSession() async {
    final identidadeSession = await _localStorage.read<String>(
      Constants.identidadeSession,
    );
    return identidadeSession ?? '';
  }

  @override
  Future<oauth2.Client?> getCredentialsIdentifierAndSecret() async {
    String? session = await getCredentialClientInSession();
    if (session != null) {
      final credentials = oauth2.Credentials.fromJson(session);
      return oauth2.Client(
        credentials,
        identifier: Constants.identifierIdentidade,
        secret: Constants.secretIdentidade,
      );
    }
    return null;
  }

  @override
  Future<void> deleteCredentialClientInSession() async {
    await _localStorage.remove(Constants.clientSession);
  }

  @override
  Future<void> deleteCookieIdentidadeInSession() async {
    await _localStorage.remove(Constants.identidadeSession);
  }

  @override
  Future<bool> destroyAccessTokenInSessionAndInIdentidade() async {
    String? accessToken = await getAccessTokenClientInSession();
    try {
      final headers = {'content-type': 'application/json'};
      final Options options = Options(headers: headers);
      final data = jsonEncode({
        'client_id': Constants.identifierIdentidade,
        'client_secret': Constants.secretIdentidade,
        'token': accessToken,
      });
      final dio = Dio();
      final response = await dio.post(
        '${Constants.urlIdentidadeAPI}/oauth/revoke',
        options: options,
        data: data,
      );
      if (response.statusCode == 200) {
        await deleteCredentialClientInSession();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(
          'Não foi possível revogar o AcessToken e encerrar a sessão.');
    }
  }

  @override
  Future<bool> logoutIdentidade() async {
    try {
      var headers = {
        "cookie": "_identidade_session=${await getCookieIdentidadeInSession()}"
      };
      final dio = Dio();
      final response = await dio.get(
          '${Constants.urlIdentidadeAPI}/users/sign_out',
          options: Options(headers: headers));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      print(e.toString());
      return false;
    }
  }
}
