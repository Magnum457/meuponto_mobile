import 'package:meuponto_mobile/app/core/life_cycle/controller_life_cycle.dart';
import 'package:meuponto_mobile/app/services/session/session_service.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/widgets/loader.dart';
import '../../models/user_model.dart';

import '../../services/user/user_service.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store, ControllerLifeCycle {
  final UserService _userService;
  final SessionService _sessionService;

  HomeStoreBase(
      {required UserService userService,
      required SessionService sessionService})
      : _userService = userService,
        _sessionService = sessionService;

  @readonly
  @observable
  UserModel? _loggedUser;

  @action
  Future<void> getUserLogged() async {
    _loggedUser = await _userService.getUser();
  }

  @action
  Future<void> logout() async {
    await _sessionService.destroyAccessTokenInSessionAndInIdentidade();
    await _sessionService.deleteCookieIdentidadeInSession();
    await _sessionService.logoutIdentidade();
  }

  @override
  void onInit([Map<String, dynamic>? params]) {}

  @override
  void onReady() {
    Loader.show();
    getUserLogged();
    Loader.hide();
  }
}
