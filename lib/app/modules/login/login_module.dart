import 'package:flutter_modular/flutter_modular.dart';

import '../../core/logger/app_logger.dart';
import '../../core/local_storage/local_storage.dart';
import '../../core/rest_client/rest_client.dart';
import '../../services/session/session_service.dart';

import '../../repositories/user/user_repository.dart';
import '../../services/user/user_service.dart';

import '../../repositories/user/user_repository_impl.dart';
import '../../services/user/user_service_impl.dart';

import 'login_page.dart';
import 'login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<UserRepository>(
      (i) => UserRepositoryImpl(
        restClient: i<RestClient>(),
        log: i<AppLogger>(),
      ),
    ),
    Bind.lazySingleton<UserService>(
      (i) => UserServiceImpl(
        userRepository: i<UserRepository>(),
        localStorage: i<LocalStorage>(),
      ),
    ),
    Bind.singleton(
      (i) => LoginStore(
        log: i<AppLogger>(),
        userService: i<UserService>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
