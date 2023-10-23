import 'package:flutter_modular/flutter_modular.dart';
import 'package:meuponto_mobile/app/modules/home/home_store.dart';

import '../../repositories/user/user_repository.dart';
import '../../services/user/user_service.dart';
import '../../repositories/user/user_repository_impl.dart';
import '../../services/user/user_service_impl.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl()),
    Bind.lazySingleton<UserService>(
        (i) => UserServiceImpl(userRepository: i(), localStorage: i())),
    Bind.lazySingleton<HomeStore>((i) => HomeStore(userService: i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
