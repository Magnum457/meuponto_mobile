import 'facial_validation_url_response.dart';
import 'tid_operation_response.dart';

abstract class FacialValidationService {
  Future<FacialValidationUrlResponse?> getFacialValidationUrl(
    String cpf,
    String sistema,
  );
  Future<TidOperationResponse?> getStatusOperationByTid(String tid);
}
