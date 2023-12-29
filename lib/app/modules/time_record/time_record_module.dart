import 'package:flutter_modular/flutter_modular.dart';

import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/ip_handler/ip_handler.dart';
import '../../core/location/locator.dart';
import '../../core/local_storage/local_storage.dart';

import '../../repositories/time_record/time_record_repository.dart';
import '../../repositories/user/user_repository.dart';

import '../../repositories/time_record/time_record_repository_impl.dart';
import '../../repositories/user/user_repository_impl.dart';

import '../../services/time_record/time_record_service.dart';
import '../../services/user/user_service.dart';

import '../../services/time_record/time_record_service_impl.dart';
import '../../services/user/user_service_impl.dart';

import 'time_record_page.dart';
import 'time_record_store.dart';

class TimeRecordModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<UserRepository>(
      (i) => UserRepositoryImpl(
        restClient: i<RestClient>(),
        log: i<AppLogger>(),
      ),
    ),
    Bind.lazySingleton<UserService>(
      (i) => UserServiceImpl(
        userRepository: i<UserRepository>(),
        localStorage: i<LocalStorage>(),
      ),
    ),
    Bind.lazySingleton<TimeRecordRepository>(
      (i) => TimeRecordRepositoryImpl(
        restClient: i<RestClient>(),
        log: i<AppLogger>(),
      ),
    ),
    Bind.lazySingleton<TimeRecordService>(
      (i) => TimeRecordServiceImpl(
        timeRecordRepository: i(),
      ),
    ),
    Bind.singleton<TimeRecordStore>(
      (i) => TimeRecordStore(
        timeRecordService: i<TimeRecordService>(),
        userService: i<UserService>(),
        ipHandler: i<IpHandler>(),
        geoLocator: i<Locator>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const TimeRecordPage(),
    )
  ];
}
