import 'package:flutter_modular/flutter_modular.dart';
import 'package:meuponto_mobile/app/modules/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const SplashPage(),
    ),
  ];
}
