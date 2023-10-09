import 'package:flutter_modular/flutter_modular.dart';
import 'package:meuponto_mobile/app/core/helpers/constants.dart';
import 'package:meuponto_mobile/app/models/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:meuponto_mobile/app/core/local_storage/local_storage.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final LocalStorage _localStorage;
  @readonly
  UserModel? _userLogged;

  _AuthStoreBase({required LocalStorage localStorage})
      : _localStorage = localStorage;

  @action
  Future<void> loadUser() async {
    final userModelJson = await _localStorage
        .read<String>(Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY);
    _userLogged = UserModel.empty();

    if (userModelJson != null) {
      _userLogged = UserModel.fromJson(userModelJson);
    } else {
      _userLogged = UserModel.empty();
    }
  }

  @action
  Future<void> logout() async {
    await _localStorage.clear();
    _userLogged = UserModel.empty();
    Modular.to.navigate('/login/');
  }
}
