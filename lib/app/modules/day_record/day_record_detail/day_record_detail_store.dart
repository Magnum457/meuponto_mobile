import 'package:meuponto_mobile/app/core/ui/widgets/loader.dart';
import 'package:mobx/mobx.dart';

import '../../../core/exceptions/failure.dart';
import '../../../core/logger/app_logger.dart';
import '../../../core/life_cycle/controller_life_cycle.dart';

import '../../../core/ui/widgets/messages.dart';
import '../../../models/day_record_model.dart';
import '../../../services/day_record/day_record_service.dart';

import '../../../models/time_record_model.dart';

part 'day_record_detail_store.g.dart';

class DayRecordDetailStore = DayRecordDetailStoreBase
    with _$DayRecordDetailStore;

abstract class DayRecordDetailStoreBase with Store, ControllerLifeCycle {
  final DayRecordService _dayRecordService;
  final AppLogger _log;
  var _dayRecordId = 0;

  DayRecordDetailStoreBase({
    required DayRecordService dayRecordService,
    required AppLogger log,
  })  : _dayRecordService = dayRecordService,
        _log = log;

  @readonly
  DayRecordModel? _dayRecordModel;
  @readonly
  List<TimeRecordModel> _timeRecords = [];

  @override
  void onInit([Map<String, dynamic>? params]) {
    super.onInit(params);
    if (params != null) _dayRecordId = int.parse(params['dayRecordId']);
  }

  @override
  void onReady() {
    super.onReady();
    getDayRecord();
  }

  @action
  Future<void> getDayRecord() async {
    try {
      Loader.show();
      _dayRecordModel = await _dayRecordService.getDayRecord(_dayRecordId);
      _timeRecords = _dayRecordModel?.timeRecords ?? [];
    } on Failure catch (e) {
      final errorMessage =
          e.message ?? 'Erro ao recuperar os dados específico desse ponto.';

      _log.error(errorMessage);
      Messages.alert(errorMessage);
    } finally {
      Loader.hide();
    }
  }
}
