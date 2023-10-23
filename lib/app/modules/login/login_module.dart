import 'package:meuponto_mobile/app/core/local_storage/local_storage.dart';
import 'package:meuponto_mobile/app/core/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import 'package:meuponto_mobile/app/modules/login/login_page.dart';
import 'package:meuponto_mobile/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meuponto_mobile/app/services/session/session_service.dart';
import 'package:meuponto_mobile/app/services/session/session_service_impl.dart';

import '../../core/logger/app_logger.dart';
import '../../core/logger/app_logger_impl.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AppLogger>((_) => AppLoggerImp()),
    Bind.lazySingleton<LocalStorage>(
        (i) => SharedPreferencesLocalStorageImpl()),
    Bind.lazySingleton<SessionService>(
        (i) => SessionServiceImpl(localStorage: i<LocalStorage>())),
    Bind.lazySingleton((i) =>
        LoginStore(log: i<AppLogger>(), sessionService: i<SessionService>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
