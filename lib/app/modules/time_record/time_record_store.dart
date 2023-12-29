import 'package:mobx/mobx.dart';

import '../../core/ip_handler/ip_handler.dart';
import '../../core/location/locator.dart';
import '../../core/life_cycle/controller_life_cycle.dart';

import '../../core/ui/widgets/loader.dart';
import '../../core/exceptions/failure.dart';
import '../../core/ui/widgets/messages.dart';

import '../../services/time_record/time_record_service.dart';
import '../../services/user/user_service.dart';

import '../../core/ip_handler/ip_response.dart';
import '../../core/location/locator_response.dart';

import '../../models/user_model.dart';
import '../../models/time_record_model.dart';
import '../../models/register_type_model.dart';

part 'time_record_store.g.dart';

class TimeRecordStore = TimeRecordStoreBase with _$TimeRecordStore;

abstract class TimeRecordStoreBase with Store, ControllerLifeCycle {
  final TimeRecordService _timeRecordService;
  final UserService _userService;
  final IpHandler _ipHandler;
  final Locator _geoLocator;

  TimeRecordStoreBase({
    required TimeRecordService timeRecordService,
    required UserService userService,
    required IpHandler ipHandler,
    required Locator geoLocator,
  })  : _timeRecordService = timeRecordService,
        _userService = userService,
        _ipHandler = ipHandler,
        _geoLocator = geoLocator;

  @readonly
  RegisterTypeModel? _registerType;
  @readonly
  UserModel? _loggedUser;
  @readonly
  IpResponse? _ipResponse;
  @readonly
  LocatorResponse? _locatorResponse;
  @readonly
  var _timeRecords = const <TimeRecordModel>[];

  @override
  void onInit([Map<String, dynamic>? params]) {}

  @override
  void onReady() async {
    Loader.show();
    await getTimeRecords();
    await listenPosition();
    Loader.hide();
  }

  @action
  Future<void> getUserLogged() async {
    try {
      _loggedUser ??= await _userService.getUserData();
    } on Failure catch (e) {
      final errorMessage =
          e.message ?? 'Error ao recuperar os dados do usuário.';

      Messages.alert(errorMessage);
    }
  }

  @action
  Future<void> getTimeRecords() async {
    try {
      await getUserLogged();
      var cpf = _loggedUser!.cpf!;
      _timeRecords = await _timeRecordService.getTimeRecordsFromCurrentDay(cpf);
    } on Failure catch (e) {
      final errorMessage =
          e.message ?? 'Erro ao recuperar os dados do registro do dia.';

      Messages.alert(errorMessage);
    }
  }

  @action
  Future<void> createTimeRecord() async {
    try {
      var newTimeRecord = TimeRecordModel(
        id: 1000000,
        ip: _ipResponse!.ip!,
        latitude: _locatorResponse!.latitude,
        longitude: _locatorResponse!.longitude,
        registerType: _registerType!,
      );
      await _timeRecordService.createTimeRecord(newTimeRecord);
    } on Failure catch (e) {
      final errorMessage = e.message ?? 'Erro ao registrar o ponto.';

      Messages.alert(errorMessage);
    }
  }

  @action
  listenPosition() async {
    try {
      _locatorResponse = await _geoLocator.getLocation();
      _ipResponse = await _ipHandler.getIp();
    } on Failure catch (e) {
      final errorMessage =
          e.message ?? 'Erro ao recuperar os dados de localização e ip.';

      Messages.alert(errorMessage);
    }
  }

  @action
  setRegisterType(String descricao, int registerTypeId) async {
    _registerType = RegisterTypeModel(
      id: registerTypeId,
      descricao: descricao,
    );
  }

  @action
  String getOptionToRegisterType(int index) {
    switch (index) {
      case 0:
        return 'Entrada';
      case 1:
        return 'Saída Almoço';
      case 2:
        return 'Retorno Almoço';
      case 3:
        return 'Saída';
      default:
        return '';
    }
  }
}
