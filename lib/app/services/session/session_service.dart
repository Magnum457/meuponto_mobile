import 'package:oauth2/oauth2.dart' as oauth2;

abstract class SessionService {
  Future<void> saveClientSession(oauth2.Client client);
  Future<void> saveIdentidadeSessionCookie(cookie);
  Future<String?> getClientSessionJson();
  Future<String?> getAccessToken();
  Future<String?> getIdentidadeSessionCookie();
  Future<oauth2.Client?> getCredentials();
  Future<void> deleteIdentidadeSessionCookie();
  Future<void> deleteClientSession();
  Future<bool> destroySessionAccessTokenIdentidade();
  Future<bool> logoutIdentidade();
}
