import '../../models/time_record_model.dart';

abstract class TimeRecordRepository {
  Future<List<TimeRecordModel>> getTimeRecords(int dayRecordId);
  Future<List<TimeRecordModel>> getTimeRecordsFromCurrentDay(String cpf);
  Future<TimeRecordModel> getTimeRecord(int timeRecordId);
  Future<void> createTimeRecord(TimeRecordModel timeRecordParams);
}
