import 'package:meuponto_mobile/app/core/exceptions/failure.dart';
import 'package:meuponto_mobile/app/core/ui/widgets/messages.dart';
import 'package:mobx/mobx.dart';

import '../../core/life_cycle/controller_life_cycle.dart';

import '../../core/ui/widgets/loader.dart';

import '../../services/day_record/day_record_service.dart';
import '../../services/user/user_service.dart';

import '../../models/user_model.dart';
import '../../models/day_record_model.dart';

part 'day_record_store.g.dart';

class DayRecordStore = DayRecordStoreBase with _$DayRecordStore;

abstract class DayRecordStoreBase with Store, ControllerLifeCycle {
  final UserService _userService;
  final DayRecordService _dayRecordService;

  DayRecordStoreBase({
    required UserService userService,
    required DayRecordService dayRecordService,
  })  : _userService = userService,
        _dayRecordService = dayRecordService;

  @readonly
  UserModel? _loggedUser;
  @readonly
  List<DayRecordModel>? _dayRecordModels;
  @readonly
  DayRecordModel? _dayRecordModel;

  @override
  void onInit([Map<String, dynamic>? params]) {}

  @override
  void onReady() async {
    Loader.show();
    await getDayRecords();
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
  Future<void> getDayRecords() async {
    try {
      await getUserLogged();
      var cpf = _loggedUser!.cpf;
      _dayRecordModels = await _dayRecordService.getDayRecords(cpf!);
    } on Failure catch (e) {
      final errorMessage = e.message ?? 'Erro ao recuperar os dados do ponto.';

      Messages.alert(errorMessage);
    }
  }

  @action
  Future<void> getDayRecord(int dayRecordId) async {
    try {
      _dayRecordModel = await _dayRecordService.getDayRecord(dayRecordId);
    } on Failure catch (e) {
      final errorMessage =
          e.message ?? 'Erro ao recuperar os dados específico desse ponto.';

      Messages.alert(errorMessage);
    }
  }
}
