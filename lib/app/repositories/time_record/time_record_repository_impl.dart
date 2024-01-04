import '../../core/exceptions/rest_client_exception.dart';
import '../../core/exceptions/failure.dart';

import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';

import '../../models/time_record_model.dart';

import 'time_record_repository.dart';

class TimeRecordRepositoryImpl implements TimeRecordRepository {
  final RestClient _restClient;
  final AppLogger _logger;

  TimeRecordRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _logger = log;

  @override
  Future<List<TimeRecordModel>> getTimeRecords(int dayRecordId) async {
    try {
      final result = await _restClient.auth().post('/get_time_records', data: {
        'day_record': {'id': dayRecordId}
      });
      var resultV = result.data
          ?.map<TimeRecordModel>((v) => TimeRecordModel.fromMap(v))
          .toList();
      return resultV ?? [];
    } on RestClientException catch (e, s) {
      _logger.error('Erro ao buscar os registros do ponto', e, s);
      throw const Failure(message: 'Erro ao buscar os registros do ponto.');
    }
  }

  @override
  Future<List<TimeRecordModel>> getTimeRecordsFromCurrentDay(String cpf) async {
    try {
      final result = await _restClient
          .auth()
          .post('/get_time_records_from_current_day', data: {'cpf': cpf});
      var resultV = result.data
          ?.map<TimeRecordModel>((v) => TimeRecordModel.fromMap(v))
          .toList();
      return resultV ?? [];
    } on RestClientException catch (e, s) {
      _logger.error('Erro ao buscar os registros do ponto', e, s);
      throw const Failure(message: 'Erro ao buscar os registros do ponto.');
    }
  }

  @override
  Future<TimeRecordModel> getTimeRecord(int timeRecordId) async {
    try {
      final result = await _restClient.auth().post('/get_time_record', data: {
        'time_record': {'id': timeRecordId}
      });
      return TimeRecordModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      _logger.error('Erro ao buscar os detalhes do registro desse ponto', e, s);
      throw const Failure(
          message: 'Erro ao buscar os detalhes do registro desse ponto.');
    }
  }

  @override
  Future<void> createTimeRecord(
      TimeRecordModel timeRecordModel, String cpf) async {
    try {
      await _restClient.auth().post('/create_time_record', data: {
        'time_record': {
          'ip': timeRecordModel.ip,
          'register_type_id': timeRecordModel.registerType.id,
          'latitude': timeRecordModel.latitude,
          'longitude': timeRecordModel.longitude,
          'address': timeRecordModel.address,
        },
        'cpf': cpf,
      });
    } on RestClientException catch (e, s) {
      _logger.error('Erro no registro do ponto.', e, s);
      throw const Failure(message: 'Erro no registro do ponto.');
    }
  }
}
