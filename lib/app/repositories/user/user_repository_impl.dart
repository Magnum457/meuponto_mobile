import '../../models/user_model.dart';

import '../../core/exceptions/failure.dart';
import '../../core/exceptions/rest_client_exception.dart';

import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient;
  final AppLogger _log;

  UserRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<String> login(String accessToken) async {
    try {
      return accessToken;
    } on RestClientException catch (e, s) {
      if (e.response.statusCode == 401) {
        throw Failure(message: e.response.data['error']);
      }
      _log.error('erro ao realizar login.', e, s);
      throw const Failure(message: 'Token não foi obtido com sucesso.');
    }
  }

  @override
  Future<UserModel> getUserLogged() async {
    try {
      final result = await _restClient.auth().userData('/api/me');
      return UserModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      if (e.response.statusCode == 422) {
        throw Failure(message: e.response.data['message']);
      }
      _log.error('Erro ao buscar dados do usuário logado', e, s);
      throw const Failure(message: 'Erro ao buscar dados do usuário logado.');
    }
  }
}
