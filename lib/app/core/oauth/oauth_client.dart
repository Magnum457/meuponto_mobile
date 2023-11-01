import 'package:meuponto_mobile/app/models/token_model.dart';

abstract class OAuthClient {
  Future<TokenModel> getToken();
}
