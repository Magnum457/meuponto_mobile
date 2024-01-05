import '../../core/helpers/constants.dart';
import '../../core/local_storage/local_storage.dart';

import '../../models/user_model.dart';

import '../../repositories/user/user_repository.dart';

import 'user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final LocalStorage _localStorage;

  UserServiceImpl({
    required UserRepository userRepository,
    required LocalStorage localStorage,
  })  : _userRepository = userRepository,
        _localStorage = localStorage;

  @override
  Future<void> login(String token) async {
    final accessToken = await _userRepository.login(token);
    await _saveAccessToken(accessToken);
    await _setUserData(accessToken);
  }

  Future<void> _saveAccessToken(String accessToken) =>
      _localStorage.write(Constants.localStorageAccessTokenKey, accessToken);

  Future<void> _setUserData(String accessToken) async {
    final userModel = await _userRepository.getUserLogged();
    await _localStorage.write<String>(
      Constants.localStorageUserLoggedDataKey,
      userModel.toJson(),
    );
  }

  @override
  Future<UserModel?> getUserData() async {
    final userLoggedData = await _localStorage
        .read<String>(Constants.localStorageUserLoggedDataKey);
    if (userLoggedData != null) {
      return UserModel.fromJson(userLoggedData);
    }
    return null;
  }
}
