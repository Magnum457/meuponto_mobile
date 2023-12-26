import '../../models/day_record_model.dart';

abstract class DayRecordService {
  Future<List<DayRecordModel>> getDayRecords(String cpf);
  Future<DayRecordModel> getDayRecord(int dayRecordId);
}
