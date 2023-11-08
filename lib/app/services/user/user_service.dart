import 'package:meuponto_mobile/app/models/user_model.dart';

abstract interface class UserService {
  Future<void> login(String accessToken);
  Future<UserModel?> getUserData();
}
