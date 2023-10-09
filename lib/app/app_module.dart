import 'package:flutter_modular/flutter_modular.dart';

import 'modules/splash/splash_module.dart';
import 'modules/home/home_module.dart';
import 'modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/auth', module: AuthModule()),
  ];
}
