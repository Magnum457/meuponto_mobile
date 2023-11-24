abstract class SessionService {
  Future<void> initializeSession(dynamic cookie);
  Future<String?> getCookieIdentidadeInSession();
  Future<void> closeSession();
}
