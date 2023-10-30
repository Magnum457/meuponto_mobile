import 'package:flutter_modular/flutter_modular.dart';

import '../../core/logger/app_logger.dart';
import '../../core/logger/app_logger_impl.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AppLogger>(
      (_) => AppLoggerImp(),
      export: true,
    ),
  ];
}
