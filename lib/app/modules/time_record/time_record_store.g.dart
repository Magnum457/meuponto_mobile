// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_record_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimeRecordStore on TimeRecordStoreBase, Store {
  late final _$_registerTypeAtom =
      Atom(name: 'TimeRecordStoreBase._registerType', context: context);

  RegisterTypeModel? get registerType {
    _$_registerTypeAtom.reportRead();
    return super._registerType;
  }

  @override
  RegisterTypeModel? get _registerType => registerType;

  @override
  set _registerType(RegisterTypeModel? value) {
    _$_registerTypeAtom.reportWrite(value, super._registerType, () {
      super._registerType = value;
    });
  }

  late final _$_loggedUserAtom =
      Atom(name: 'TimeRecordStoreBase._loggedUser', context: context);

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

  late final _$_ipResponseAtom =
      Atom(name: 'TimeRecordStoreBase._ipResponse', context: context);

  IpResponse? get ipResponse {
    _$_ipResponseAtom.reportRead();
    return super._ipResponse;
  }

  @override
  IpResponse? get _ipResponse => ipResponse;

  @override
  set _ipResponse(IpResponse? value) {
    _$_ipResponseAtom.reportWrite(value, super._ipResponse, () {
      super._ipResponse = value;
    });
  }

  late final _$_locatorResponseAtom =
      Atom(name: 'TimeRecordStoreBase._locatorResponse', context: context);

  LocatorResponse? get locatorResponse {
    _$_locatorResponseAtom.reportRead();
    return super._locatorResponse;
  }

  @override
  LocatorResponse? get _locatorResponse => locatorResponse;

  @override
  set _locatorResponse(LocatorResponse? value) {
    _$_locatorResponseAtom.reportWrite(value, super._locatorResponse, () {
      super._locatorResponse = value;
    });
  }

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

  late final _$getUserLoggedAsyncAction =
      AsyncAction('TimeRecordStoreBase.getUserLogged', context: context);

  @override
  Future<void> getUserLogged() {
    return _$getUserLoggedAsyncAction.run(() => super.getUserLogged());
  }

  late final _$getTimeRecordsAsyncAction =
      AsyncAction('TimeRecordStoreBase.getTimeRecords', context: context);

  @override
  Future<void> getTimeRecords() {
    return _$getTimeRecordsAsyncAction.run(() => super.getTimeRecords());
  }

  late final _$createTimeRecordAsyncAction =
      AsyncAction('TimeRecordStoreBase.createTimeRecord', context: context);

  @override
  Future<void> createTimeRecord() {
    return _$createTimeRecordAsyncAction.run(() => super.createTimeRecord());
  }

  late final _$listenPositionAsyncAction =
      AsyncAction('TimeRecordStoreBase.listenPosition', context: context);

  @override
  Future listenPosition() {
    return _$listenPositionAsyncAction.run(() => super.listenPosition());
  }

  late final _$setRegisterTypeAsyncAction =
      AsyncAction('TimeRecordStoreBase.setRegisterType', context: context);

  @override
  Future setRegisterType(String descricao, int registerTypeId) {
    return _$setRegisterTypeAsyncAction
        .run(() => super.setRegisterType(descricao, registerTypeId));
  }

  late final _$TimeRecordStoreBaseActionController =
      ActionController(name: 'TimeRecordStoreBase', context: context);

  @override
  String getOptionToRegisterType(int index) {
    final _$actionInfo = _$TimeRecordStoreBaseActionController.startAction(
        name: 'TimeRecordStoreBase.getOptionToRegisterType');
    try {
      return super.getOptionToRegisterType(index);
    } finally {
      _$TimeRecordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
