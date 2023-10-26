import 'package:flutter_modular/flutter_modular.dart';

import 'policy_page.dart';

class PolicyModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const PolicyPage()),
  ];
}
