import 'package:flutter_modular/flutter_modular.dart';

import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';

import '../../repositories/time_record/time_record_repository.dart';
import '../../repositories/time_record/time_record_repository_impl.dart';

import '../../services/time_record/time_record_service.dart';
import '../../services/time_record/time_record_service_impl.dart';

import 'time_record_page.dart';
import 'time_record_store.dart';

class TimeRecordModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<TimeRecordRepository>((i) => TimeRecordRepositoryImpl(
          restClient: i<RestClient>(),
          log: i<AppLogger>(),
        )),
    Bind.lazySingleton<TimeRecordService>(
      (i) => TimeRecordServiceImpl(
        timeRecordRepository: i(),
      ),
    ),
    Bind.singleton<TimeRecordStore>(
      (i) => TimeRecordStore(
        timeRecordService: i(),
        log: i(),
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
