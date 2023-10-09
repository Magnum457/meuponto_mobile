import 'package:meuponto_mobile/app/core/local_storage/flutter_secure_storage/flutter_secure_storage_local_storage_impl.dart';
import 'package:meuponto_mobile/app/core/local_storage/local_storage.dart';
import 'package:meuponto_mobile/app/core/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import 'package:meuponto_mobile/app/modules/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<LocalStorage>((i) => SharedPreferencesLocalStorageImpl(),
        export: true),
    Bind.lazySingleton<LocalSecureStorage>(
        (_) => FlutterSecureStorageLocalStorageImpl(),
        export: true),
    Bind.lazySingleton<AuthStore>((i) => AuthStore(localStorage: i()),
        export: true),
  ];
}
