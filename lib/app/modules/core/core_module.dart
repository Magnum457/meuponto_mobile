import 'package:flutter_modular/flutter_modular.dart';

import '../../core/logger/app_logger.dart';
import '../../core/logger/app_logger_impl.dart';

import '../../core/local_storage/local_storage.dart';
import '../../core/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import '../../core/local_storage/flutter_secure_storage/flutter_secure_storage_local_storage_impl.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AppLogger>(
      (_) => AppLoggerImp(),
      export: true,
    ),
    Bind.lazySingleton<LocalStorage>(
      (i) => SharedPreferencesLocalStorageImpl(),
      export: true,
    ),
    Bind.lazySingleton<LocalSecureStorage>(
      (i) => FlutterSecureStorageLocalStorageImpl(),
      export: true,
    ),
  ];
}
