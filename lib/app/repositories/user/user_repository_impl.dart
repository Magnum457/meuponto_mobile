import 'package:meuponto_mobile/app/models/user_model.dart';

import '../../core/exceptions/failure.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl();

  @override
  Future<String> login() async {
    try {
      return '';
    } on Exception {
      throw const Failure(message: 'CPF ou senha inválidos.');
    }
  }

  @override
  Future<UserModel> getUserLogged() async {
    try {
      return UserModel.fromMap(UserModel.empty().toMap());
    } on Exception {
      throw const Failure(message: 'Erro ao buscar dados do usuário logado.');
    }
  }
}
