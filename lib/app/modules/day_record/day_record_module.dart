import 'package:flutter_modular/flutter_modular.dart';

import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/local_storage/local_storage.dart';

import '../../repositories/day_record/day_record_repository.dart';
import '../../repositories/user/user_repository.dart';

import '../../repositories/day_record/day_record_repository_impl.dart';
import '../../repositories/user/user_repository_impl.dart';

import '../../services/day_record/day_record_service.dart';
import '../../services/user/user_service.dart';

import '../../services/day_record/day_record_service_impl.dart';
import '../../services/user/user_service_impl.dart';

import 'day_record_detail/day_record_detail_module.dart';
import 'day_record_page.dart';
import 'day_record_store.dart';

class DayRecordModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(
          restClient: i<RestClient>(),
          log: i<AppLogger>(),
        )),
    Bind.lazySingleton<UserService>(
      (i) => UserServiceImpl(
        userRepository: i<UserRepository>(),
        localStorage: i<LocalStorage>(),
      ),
    ),
    Bind.lazySingleton<DayRecordRepository>(
      (i) => DayRecordRepositoryImpl(
        restClient: i<RestClient>(),
        log: i<AppLogger>(),
      ),
    ),
    Bind.lazySingleton<DayRecordService>(
      (i) => DayRecordServiceImpl(
        dayRecordRepository: i<DayRecordRepository>(),
      ),
    ),
    Bind.singleton<DayRecordStore>(
      (i) => DayRecordStore(
        dayRecordService: i<DayRecordService>(),
        userService: i<UserService>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const DayRecordPage(),
    ),
    ModuleRoute(
      '/day_record_detail',
      module: DayRecordDetailModule(),
    ),
  ];
}
