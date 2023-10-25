import 'package:oauth2/oauth2.dart' as oauth2;

abstract class SessionService {
  Future<void> saveCredentialClientInSession(oauth2.Client client);
  Future<void> saveCookieIdentidadeInSession(cookie);
  Future<String?> getCredentialClientInSession();
  Future<String?> getAccessTokenClientInSession();
  Future<String?> getCookieIdentidadeInSession();
  Future<oauth2.Client?> getCredentialsIdentifierAndSecret();
  Future<void> deleteCredentialClientInSession();
  Future<void> deleteCookieIdentidadeInSession();
  Future<bool> destroyAccessTokenInSessionAndInIdentidade();
  Future<bool> logoutIdentidade();
}
