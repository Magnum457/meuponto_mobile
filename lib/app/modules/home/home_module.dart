import 'package:flutter_modular/flutter_modular.dart';

import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';

import '../../services/session/session_service.dart';
import '../../repositories/user/user_repository.dart';
import '../../services/user/user_service.dart';

import '../../services/session/session_service_impl.dart';
import '../../repositories/user/user_repository_impl.dart';
import '../../services/user/user_service_impl.dart';

import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(
          restClient: i<RestClient>(),
          log: i<AppLogger>(),
        )),
    Bind.lazySingleton<UserService>(
      (i) => UserServiceImpl(
        userRepository: i(),
        localStorage: i(),
      ),
    ),
    Bind.lazySingleton<SessionService>(
      (i) => SessionServiceImpl(
        localStorage: i(),
      ),
    ),
    Bind.singleton<HomeStore>(
      (i) => HomeStore(
        userService: i(),
        sessionService: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
