import 'package:mobx/mobx.dart';

import '../../core/life_cycle/controller_life_cycle.dart';

import '../../core/ui/widgets/loader.dart';
import '../../core/ui/widgets/messages.dart';

import '../../models/user_model.dart';
import '../../models/service_model.dart';

import '../../services/user/user_service.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store, ControllerLifeCycle {
  final UserService _userService;

  HomeStoreBase({required UserService userService})
      : _userService = userService;

  @readonly
  @observable
  UserModel? _loggedUser;

  @readonly
  List<ServiceModel> _servicos = [];

  @action
  Future<void> getUserLogged() async {
    _loggedUser = await _userService.getUserData();
  }

  @override
  void onInit([Map<String, dynamic>? params]) {}

  @override
  void onReady() async {
    Loader.show();
    getUserLogged();
    await getServices();
    Loader.hide();
  }

  @action
  Future<void> getServices() async {
    try {
      final services = ServiceModel.getServiceModels();
      _servicos = [...services];
    } catch (e, s) {
      Messages.alert('Erro ao carregar Serviços');

      Error.throwWithStackTrace(e, s);
    }
  }
}
