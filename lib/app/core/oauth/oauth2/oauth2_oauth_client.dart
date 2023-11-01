import 'package:flutter/material.dart';
import 'package:meuponto_mobile/app/core/oauth/oauth_client.dart';
import 'package:meuponto_mobile/app/models/token_model.dart';
import 'package:oauth2/oauth2.dart';

import '../../../modules/login/widgets/authorization_webview.dart';

class OAuth2OAuthClient implements OAuthClient {
  final Uri authorizationEndpoint;
  final Uri tokenEndpoint;
  final String identifier;
  final String secret;
  final Uri redirectUrl;
  final BuildContext context;

  OAuth2OAuthClient(
    this.context, {
    required this.authorizationEndpoint,
    required this.tokenEndpoint,
    required this.identifier,
    required this.secret,
    required this.redirectUrl,
  });
  // final authorizationEndpoint =
  //     Uri.parse('${Constants.urlIdentidadeAPI}/oauth/authorize');
  // final tokenEndpoint = Uri.parse('${Constants.urlIdentidadeAPI}/oauth/token');
  // final identifier = Constants.identifierIdentidade;
  // final secret = Constants.secretIdentidade;
  // final redirectUrl = Uri.parse(
  //     'https://pauta-eletronica.apps.dtcn.detran.ce.gov.br/pauta_eletronica_app');

  @override
  Future<TokenModel> getToken() async {
    final grant = _generateCodeGrant();

    try {
      final responseUrl = await Navigator.of(context).push(
        _buildAuthorizationPageRoute(grant: grant, redirectUrl: redirectUrl),
      );

      if (responseUrl != null) {
        final client = await grant
            .handleAuthorizationResponse(responseUrl.queryParameters);
        final oauthToken = {
          'accessToken': client.credentials.accessToken,
          'refreshToken': client.credentials.refreshToken,
          'expirationTime': client.credentials.expiration,
        };
        return TokenModel.fromMap(oauthToken);
      } else {
        throw Exception('Erro ao realizar login');
      }
    } on Exception {
      throw Exception('Erro ao realizar login');
    }
  }

  MaterialPageRoute _buildAuthorizationPageRoute({
    required AuthorizationCodeGrant grant,
    required Uri redirectUrl,
  }) {
    return MaterialPageRoute(
      builder: (context) => AuthorizationWebView(
        grant: grant,
        redirectUrl: redirectUrl,
      ),
    );
  }

  AuthorizationCodeGrant _generateCodeGrant() {
    return AuthorizationCodeGrant(
      identifier,
      authorizationEndpoint,
      tokenEndpoint,
      secret: secret,
    );
  }
}
