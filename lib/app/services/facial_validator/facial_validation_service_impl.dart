import '../../core/exceptions/failure.dart';
import '../../core/exceptions/rest_client_exception.dart';

import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';

import 'facial_validation_service.dart';
import 'facial_validation_url_response.dart';
import 'tid_operation_response.dart';

class FacialValidationServiceImpl implements FacialValidationService {
  final RestClient _restClient;
  final AppLogger _log;

  FacialValidationServiceImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<FacialValidationUrlResponse?> getFacialValidationUrl(
    String cpf,
    String sistema,
  ) async {
    try {
      final result = await _restClient
          .facialValidatorRequest()
          .requireSecretFacialValidator()
          .post('requisita_rota_com_match', data: {
        'cpf': cpf,
        'sistema': sistema,
      });

      return FacialValidationUrlResponse(
        url: result.data['url'],
        tid: result.data['tid'],
      );
    } on RestClientException catch (e, s) {
      if (e.response.statusCode == 401) {
        throw Failure(message: e.response.data['error']);
      }
      _log.error('erro ao recuperar a url da validação facial.', e, s);
      throw const Failure(
          message: 'Erro ao recuperar a url da validação facial.');
    }
  }

  @override
  Future<TidOperationResponse?> getStatusOperationByTid(String tid) async {
    try {
      final result = await _restClient
          .facialValidatorRequest()
          .requireSecretFacialValidator()
          .post('recupera_operacao', data: {
        'tid': tid,
      });

      return TidOperationResponse(
        cpf: result.data['cpf'],
        tid: result.data['tid'],
        hasSelfie: result.data['has_selfie'],
        scoreSelfie: result.data['score_selfie'],
      );
    } on RestClientException catch (e, s) {
      if (e.response.statusCode == 401) {
        throw Failure(message: e.response.data['error']);
      }
      _log.error('erro ao recuperar os dados da operação.', e, s);
      throw const Failure(message: 'Erro ao recuperar os dados da operação.');
    }
  }
}
