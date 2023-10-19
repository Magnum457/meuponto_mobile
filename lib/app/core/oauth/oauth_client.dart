import 'package:oauth2/oauth2.dart' as oauth2;

abstract class OauthClient {
  Future<oauth2.Client> getClient(
    String identifier,
    Uri authorizationEndpoint,
    tokenEndpoint,
    Uri redirectUrl,
    String secret,
  );
}
