import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';

import '../../models/day_record_model.dart';

import 'day_record_repository.dart';

import '../../core/exceptions/failure.dart';
import '../../core/exceptions/rest_client_exception.dart';

class DayRecordRepositoryImpl implements DayRecordRepository {
  final RestClient _restClient;
  final AppLogger _logger;

  DayRecordRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _logger = log;

  @override
  Future<List<DayRecordModel>> getDayRecords(String cpf) async {
    try {
      final result = await _restClient
          .auth()
          .post('/get_day_records/', data: {'cpf': cpf});
      var resultV = result.data
          ?.map<DayRecordModel>((v) => DayRecordModel.fromMap(v))
          .toList();
      return resultV ?? [];
    } on RestClientException catch (e, s) {
      _logger.error('Erro ao buscar os registros dos pontos diários.', e, s);
      throw const Failure(
          message: 'Erro ao buscar os registros dos pontos diários.');
    }
  }

  @override
  Future<DayRecordModel> getDayRecord(int dayRecordId) async {
    try {
      final result = await _restClient
          .auth()
          .post('/get_day_record/', data: {'id': dayRecordId});
      return DayRecordModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      if (e.response.statusCode == 422) {
        throw Failure(message: e.response.data['message']);
      }
      _logger.error('Erro ao buscar o registro do dia.', e, s);
      throw const Failure(message: 'Erro ao buscar o registro do dia.');
    }
  }
}
