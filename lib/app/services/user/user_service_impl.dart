import 'package:meuponto_mobile/app/core/helpers/constants.dart';
import 'package:meuponto_mobile/app/core/local_storage/local_storage.dart';
import 'package:meuponto_mobile/app/models/user_model.dart';
import 'package:meuponto_mobile/app/repositories/user/user_repository.dart';

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
  Future<void> login() async {
    await saveAccessToken('');
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveUser(userModel) async {
    await _localStorage.write(
        Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY, userModel.toJson());
  }

  @override
  Future<void> saveAccessToken(String accessToken) => _localStorage.write(
      Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY, accessToken);

  @override
  Future<UserModel?> getUser() async {
    final userLoggedData = await _localStorage
        .read<String>(Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY);
    if (userLoggedData != null) {
      return UserModel.fromJson(userLoggedData);
    }
    return null;
  }
}
