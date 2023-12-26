import 'package:flutter_modular/flutter_modular.dart';

import 'modules/core/core_module.dart';
import 'modules/login/login_module.dart';
import 'modules/policy/policy_module.dart';
import 'modules/time_record/time_record_module.dart';
import 'modules/day_record/day_record_module.dart';
import 'modules/splash/splash_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      '/',
      module: SplashModule(),
    ),
    ModuleRoute(
      '/home',
      module: HomeModule(),
    ),
    ModuleRoute(
      '/login',
      module: LoginModule(),
    ),
    ModuleRoute(
      '/policy',
      module: PolicyModule(),
    ),
    ModuleRoute(
      '/time_record',
      module: TimeRecordModule(),
    ),
    ModuleRoute(
      '/day_record',
      module: DayRecordModule(),
    ),
  ];

  @override
  List<Module> get imports => [CoreModule()];
}
