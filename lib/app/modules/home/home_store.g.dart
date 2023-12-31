// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$_loggedUserAtom =
      Atom(name: 'HomeStoreBase._loggedUser', context: context);

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

  late final _$_servicosAtom =
      Atom(name: 'HomeStoreBase._servicos', context: context);

  List<ServiceModel> get servicos {
    _$_servicosAtom.reportRead();
    return super._servicos;
  }

  @override
  List<ServiceModel> get _servicos => servicos;

  @override
  set _servicos(List<ServiceModel> value) {
    _$_servicosAtom.reportWrite(value, super._servicos, () {
      super._servicos = value;
    });
  }

  late final _$getUserLoggedAsyncAction =
      AsyncAction('HomeStoreBase.getUserLogged', context: context);

  @override
  Future<void> getUserLogged() {
    return _$getUserLoggedAsyncAction.run(() => super.getUserLogged());
  }

  late final _$getServicesAsyncAction =
      AsyncAction('HomeStoreBase.getServices', context: context);

  @override
  Future<void> getServices() {
    return _$getServicesAsyncAction.run(() => super.getServices());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
