import 'package:meuponto_mobile/app/core/life_cycle/controller_life_cycle.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/widgets/loader.dart';
import '../../models/user_model.dart';

import '../../services/user/user_service.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store, ControllerLifeCycle {
  final UserService _userService;

  HomeStoreBase({
    required UserService userService,
  }) : _userService = userService;

  @readonly
  @observable
  UserModel? _loggedUser;

  @action
  Future<void> getUserLogged() async {
    _loggedUser = await _userService.getUser();
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
