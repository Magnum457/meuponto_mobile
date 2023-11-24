import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/local_storage/local_storage.dart';

import '../../../services/session/session_service.dart';

import '../../../models/user_model.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final LocalStorage _localStorage;
  final SessionService _sessionService;

  @readonly
  UserModel? _userLogged;

  AuthStoreBase(
      {required LocalStorage localStorage,
      required SessionService sessionService})
      : _localStorage = localStorage,
        _sessionService = sessionService;

  @action
  Future<void> loadUser() async {
    final userModelJson = await _localStorage
        .read<String>(Constants.localStorageUserLoggedDataKey);

    if (userModelJson != null) {
      _userLogged = UserModel.fromJson(userModelJson);
    } else {
      _userLogged = UserModel.empty();
    }
  }

  @action
  Future<void> logout() async {
    await _sessionService.closeSession();
    await _localStorage.clear();
    _userLogged = UserModel.empty();
    Modular.to.navigate('/login/');
  }
}
