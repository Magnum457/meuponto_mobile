import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/logger/app_logger.dart';
import '../../../core/rest_client/rest_client.dart';

import '../../../repositories/day_record/day_record_repository.dart';
import '../../../repositories/day_record/day_record_repository_impl.dart';

import '../../../services/day_record/day_record_service.dart';
import '../../../services/day_record/day_record_service_impl.dart';

import 'day_record_detail_store.dart';
import 'day_record_detail_page.dart';

class DayRecordDetailModule extends Module {
  @override
  final List<Bind> binds = [
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
    Bind.singleton(
      (i) => DayRecordDetailStore(
        dayRecordService: i<DayRecordService>(),
        log: i<AppLogger>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/:day_record_id',
      child: (context, args) =>
          DayRecordDetailPage(dayRecordId: args.params['day_record_id']),
    ),
  ];
}
