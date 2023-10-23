import 'package:meuponto_mobile/app/core/local_storage/local_storage.dart';
import 'package:meuponto_mobile/app/core/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import 'package:meuponto_mobile/app/modules/login/login_page.dart';
import 'package:meuponto_mobile/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/logger/app_logger.dart';
import '../../services/session/session_service.dart';
import '../../repositories/user/user_repository.dart';
import '../../services/user/user_service.dart';
import '../../core/logger/app_logger_impl.dart';
import '../../services/session/session_service_impl.dart';
import '../../repositories/user/user_repository_impl.dart';
import '../../services/user/user_service_impl.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AppLogger>((_) => AppLoggerImp()),
    Bind.lazySingleton<LocalStorage>(
        (i) => SharedPreferencesLocalStorageImpl()),
    Bind.lazySingleton<SessionService>(
        (i) => SessionServiceImpl(localStorage: i<LocalStorage>())),
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl()),
    Bind.lazySingleton<UserService>(
        (i) => UserServiceImpl(userRepository: i(), localStorage: i())),
    Bind.lazySingleton((i) => LoginStore(
        log: i<AppLogger>(),
        sessionService: i<SessionService>(),
        userService: i<UserService>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
