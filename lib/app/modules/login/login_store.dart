import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meuponto_mobile/app/core/ui/widgets/messages.dart';
import 'package:meuponto_mobile/app/modules/login/widgets/authorization_webview.dart';
import 'package:meuponto_mobile/app/services/session/session_service.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:mobx/mobx.dart';

import '../../core/helpers/constants.dart';
import '../../core/logger/app_logger.dart';
import '../../services/user/user_service.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final AppLogger _log;
  final SessionService _sessionService;
  final UserService _userService;

  LoginStoreBase({
    required AppLogger log,
    required SessionService sessionService,
    required UserService userService,
  })  : _log = log,
        _sessionService = sessionService,
        _userService = userService;

  void loginIdentidade(BuildContext context) async {
    final authorizationEndpoint =
        Uri.parse('${Constants.urlIdentidadeAPI}/oauth/authorize');
    final tokenEndpoint =
        Uri.parse('${Constants.urlIdentidadeAPI}/oauth/token');
    const identifier = Constants.identifierIdentidade;
    const secret = Constants.secretIdentidade;
    final redirectUrl = Uri.parse(
        'https://pauta-eletronica.apps.dtcn.detran.ce.gov.br/pauta_eletronica_app');

    final clientSession = await _sessionService.getClientSessionJson();
    if (clientSession != null) {
      Messages.info('O usuário já está logado!!');
      _sessionService.deleteClientSession();
      Modular.to.navigate('/home/');
    } else {
      final client = await createClient(
        identifier,
        authorizationEndpoint,
        tokenEndpoint,
        redirectUrl,
        secret,
        context,
      );

      _sessionService.saveClientSession(client);
      _userService.saveAccessToken(client.credentials.accessToken);
      Messages.alert('Usuário logado com sucesso!!');
      Modular.to.navigate('/home/');

      debugPrint(client.credentials.accessToken);
    }
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

      if (responseUrl != null) {
        return await grant
            .handleAuthorizationResponse(responseUrl.queryParameters);
      } else {
        throw Exception('Erro ao realizar login');
      }
    } catch (e) {
      _log.error(e);
      throw Exception('Erro ao realizar login');
    }
  }
}
