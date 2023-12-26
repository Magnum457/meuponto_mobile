// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_record_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DayRecordDetailStore on DayRecordDetailStoreBase, Store {
  late final _$_dayRecordModelAtom =
      Atom(name: 'DayRecordDetailStoreBase._dayRecordModel', context: context);

  DayRecordModel? get dayRecordModel {
    _$_dayRecordModelAtom.reportRead();
    return super._dayRecordModel;
  }

  @override
  DayRecordModel? get _dayRecordModel => dayRecordModel;

  @override
  set _dayRecordModel(DayRecordModel? value) {
    _$_dayRecordModelAtom.reportWrite(value, super._dayRecordModel, () {
      super._dayRecordModel = value;
    });
  }

  late final _$_timeRecordsAtom =
      Atom(name: 'DayRecordDetailStoreBase._timeRecords', context: context);

  List<TimeRecordModel> get timeRecords {
    _$_timeRecordsAtom.reportRead();
    return super._timeRecords;
  }

  @override
  List<TimeRecordModel> get _timeRecords => timeRecords;

  @override
  set _timeRecords(List<TimeRecordModel> value) {
    _$_timeRecordsAtom.reportWrite(value, super._timeRecords, () {
      super._timeRecords = value;
    });
  }

  late final _$getDayRecordAsyncAction =
      AsyncAction('DayRecordDetailStoreBase.getDayRecord', context: context);

  @override
  Future<void> getDayRecord() {
    return _$getDayRecordAsyncAction.run(() => super.getDayRecord());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
