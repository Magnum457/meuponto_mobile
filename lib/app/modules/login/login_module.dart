import 'package:meuponto_mobile/app/modules/login/login_page.dart';
import 'package:meuponto_mobile/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/logger/app_logger.dart';
import '../../core/logger/app_logger_impl.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AppLogger>((_) => AppLoggerImp()),
    Bind.lazySingleton((i) => LoginStore(log: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
