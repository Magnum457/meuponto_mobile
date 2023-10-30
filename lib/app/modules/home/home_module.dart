import 'package:flutter_modular/flutter_modular.dart';
import 'package:meuponto_mobile/app/modules/home/home_store.dart';
import 'package:meuponto_mobile/app/services/session/session_service.dart';
import 'package:meuponto_mobile/app/services/session/session_service_impl.dart';

import '../../repositories/user/user_repository.dart';
import '../../services/user/user_service.dart';
import '../../repositories/user/user_repository_impl.dart';
import '../../services/user/user_service_impl.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl()),
    Bind.lazySingleton<UserService>(
        (i) => UserServiceImpl(userRepository: i(), localStorage: i())),
    Bind.lazySingleton<SessionService>(
        (i) => SessionServiceImpl(localStorage: i())),
    Bind.singleton<HomeStore>(
        (i) => HomeStore(userService: i(), sessionService: i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
