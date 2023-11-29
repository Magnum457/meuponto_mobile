// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_record_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DayRecordStore on DayRecordStoreBase, Store {
  late final _$_loggedUserAtom =
      Atom(name: 'DayRecordStoreBase._loggedUser', context: context);

  UserModel? get loggedUser {
    _$_loggedUserAtom.reportRead();
    return super._loggedUser;
  }

  @override
  UserModel? get _loggedUser => loggedUser;

  @override
  set _loggedUser(UserModel? value) {
    _$_loggedUserAtom.reportWrite(value, super._loggedUser, () {
      super._loggedUser = value;
    });
  }

  late final _$_dayRecordModelsAtom =
      Atom(name: 'DayRecordStoreBase._dayRecordModels', context: context);

  List<DayRecordModel>? get dayRecordModels {
    _$_dayRecordModelsAtom.reportRead();
    return super._dayRecordModels;
  }

  @override
  List<DayRecordModel>? get _dayRecordModels => dayRecordModels;

  @override
  set _dayRecordModels(List<DayRecordModel>? value) {
    _$_dayRecordModelsAtom.reportWrite(value, super._dayRecordModels, () {
      super._dayRecordModels = value;
    });
  }

  late final _$_dayRecordModelAtom =
      Atom(name: 'DayRecordStoreBase._dayRecordModel', context: context);

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

  late final _$getUserLoggedAsyncAction =
      AsyncAction('DayRecordStoreBase.getUserLogged', context: context);

  @override
  Future<void> getUserLogged() {
    return _$getUserLoggedAsyncAction.run(() => super.getUserLogged());
  }

  late final _$getDayRecordsAsyncAction =
      AsyncAction('DayRecordStoreBase.getDayRecords', context: context);

  @override
  Future<void> getDayRecords() {
    return _$getDayRecordsAsyncAction.run(() => super.getDayRecords());
  }

  late final _$getDayRecordAsyncAction =
      AsyncAction('DayRecordStoreBase.getDayRecord', context: context);

  @override
  Future<void> getDayRecord(int dayRecordId) {
    return _$getDayRecordAsyncAction.run(() => super.getDayRecord(dayRecordId));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
