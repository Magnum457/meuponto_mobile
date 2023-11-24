import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/oauth/oauth2/oauth2_oauth_client.dart';

import '../../core/exceptions/failure.dart';

import '../../core/helpers/constants.dart';
import '../../core/ui/widgets/messages.dart';

import '../../core/logger/app_logger.dart';
import '../../services/user/user_service.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final AppLogger _log;
  final UserService _userService;

  LoginStoreBase({
    required AppLogger log,
    required UserService userService,
  })  : _log = log,
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

    final oauthClient = OAuth2OAuthClient(
      context,
      authorizationEndpoint: authorizationEndpoint,
      tokenEndpoint: tokenEndpoint,
      identifier: identifier,
      secret: secret,
      redirectUrl: redirectUrl,
    );
    try {
      final token = await oauthClient.getToken();
      await _userService.login(token.accessToken);
      Modular.to.navigate('/home/');
    } on Failure catch (e) {
      final errorMessage = e.message ?? 'Error while trying to login';

      _log.error(errorMessage);
      Messages.alert(errorMessage);
    }
  }
}
