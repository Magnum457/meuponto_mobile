import '../../models/day_record_model.dart';

abstract class DayRecordRepository {
  Future<List<DayRecordModel>> getDayRecords(String cpf);
  Future<DayRecordModel> getDayRecord(int dayRecordId);
}
