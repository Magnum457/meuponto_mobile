import 'package:meuponto_mobile/app/models/user_model.dart';

abstract interface class UserRepository {
  Future<String> login(String accessToken);
  Future<UserModel> getUserLogged();
}
