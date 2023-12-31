// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_record_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimeRecordStore on TimeRecordStoreBase, Store {
  late final _$_timeRecordsAtom =
      Atom(name: 'TimeRecordStoreBase._timeRecords', context: context);

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

  late final _$getTimeRecordsAsyncAction =
      AsyncAction('TimeRecordStoreBase.getTimeRecords', context: context);

  @override
  Future<void> getTimeRecords() {
    return _$getTimeRecordsAsyncAction.run(() => super.getTimeRecords());
  }

  late final _$listenPositionAsyncAction =
      AsyncAction('TimeRecordStoreBase.listenPosition', context: context);

  @override
  Future listenPosition() {
    return _$listenPositionAsyncAction.run(() => super.listenPosition());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
