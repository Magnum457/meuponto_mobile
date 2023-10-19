import 'package:flutter/material.dart';
import 'package:meuponto_mobile/app/modules/login/widgets/authorization_webview.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:mobx/mobx.dart';

import '../../core/helpers/constants.dart';
import '../../core/logger/app_logger.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final AppLogger _log;

  LoginStoreBase({
    required AppLogger log,
  }) : _log = log;

  void loginIdentidade(BuildContext context) async {
    final authorizationEndpoint =
        Uri.parse('${Constants.urlIdentidadeAPI}/oauth/authorize');
    final tokenEndpoint =
        Uri.parse('${Constants.urlIdentidadeAPI}/oauth/token');
    const identifier = Constants.identifierIdentidade;
    const secret = Constants.secretIdentidade;
    final redirectUrl =
        Uri.parse('https://meuponto.apps.dtcn.detran.ce.gov.br/meuponto');

    final client = await createClient(
      identifier,
      authorizationEndpoint,
      tokenEndpoint,
      redirectUrl,
      secret,
      context,
    );

    debugPrint(client.credentials.accessToken);
  }

  Future<oauth2.Client> createClient(
    String identifier,
    Uri authorizationEndpoint,
    Uri tokenEndpoint,
    Uri redirectUrl,
    String secret,
    BuildContext context,
  ) async {
    final grant = oauth2.AuthorizationCodeGrant(
      identifier,
      authorizationEndpoint,
      tokenEndpoint,
      secret: secret,
    );

    try {
      final responseUrl = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AuthorizationWebView(
            grant: grant,
            redirectUrl: redirectUrl,
          ),
        ),
      );

      return await grant
          .handleAuthorizationResponse(responseUrl.queryParameters);
    } catch (e) {
      _log.error(e);
      throw Exception('Erro ao realizar login');
    }
  }
}
