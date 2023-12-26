import '../../models/time_record_model.dart';

abstract class TimeRecordService {
  Future<List<TimeRecordModel>> getTimeRecords(int dayRecordId);
  Future<TimeRecordModel> getTimeRecord(int timeRecordId);
  Future<void> createTimeRecord(TimeRecordModel timeRecordModel);
}
