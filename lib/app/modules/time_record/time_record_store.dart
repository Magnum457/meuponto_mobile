import 'package:mobx/mobx.dart';

import '../../core/logger/app_logger.dart';
import '../../core/life_cycle/controller_life_cycle.dart';

import '../../core/ui/widgets/loader.dart';

import '../../services/time_record/time_record_service.dart';

import '../../models/time_record_model.dart';

part 'time_record_store.g.dart';

class TimeRecordStore = TimeRecordStoreBase with _$TimeRecordStore;

abstract class TimeRecordStoreBase with Store, ControllerLifeCycle {
  final TimeRecordService _timeRecordService;
  final AppLogger _log;

  TimeRecordStoreBase({
    required TimeRecordService timeRecordService,
    required AppLogger log,
  })  : _timeRecordService = timeRecordService,
        _log = log;

  @override
  void onInit([Map<String, dynamic>? params]) {}

  @override
  void onReady() async {
    Loader.show();
    getTimeRecords();
    Loader.hide();
  }

  @readonly
  var _timeRecords = const <TimeRecordModel>[];

  @action
  Future<void> getTimeRecords() async {
    try {
      _timeRecords = [];
    } finally {}
  }
}
