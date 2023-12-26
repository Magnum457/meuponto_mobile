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

  late final _$_dayRecordsAtom =
      Atom(name: 'DayRecordStoreBase._dayRecords', context: context);

  List<DayRecordModel> get dayRecords {
    _$_dayRecordsAtom.reportRead();
    return super._dayRecords;
  }

  @override
  List<DayRecordModel> get _dayRecords => dayRecords;

  @override
  set _dayRecords(List<DayRecordModel> value) {
    _$_dayRecordsAtom.reportWrite(value, super._dayRecords, () {
      super._dayRecords = value;
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

  @override
  String toString() {
    return '''

    ''';
  }
}
