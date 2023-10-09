import 'package:flutter_modular/flutter_modular.dart';
import 'package:meuponto_mobile/app/modules/auth/auth_module.dart';
import 'package:meuponto_mobile/app/modules/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => SplashPage(
        authStore: Modular.get(),
      ),
    ),
  ];
}
