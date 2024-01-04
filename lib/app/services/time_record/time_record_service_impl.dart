import '../../models/time_record_model.dart';

import '../../repositories/time_record/time_record_repository.dart';

import 'time_record_service.dart';

class TimeRecordServiceImpl implements TimeRecordService {
  final TimeRecordRepository _timeRecordRepository;

  TimeRecordServiceImpl({required TimeRecordRepository timeRecordRepository})
      : _timeRecordRepository = timeRecordRepository;

  @override
  Future<List<TimeRecordModel>> getTimeRecords(int dayRecordId) =>
      _timeRecordRepository.getTimeRecords(dayRecordId);

  @override
  Future<List<TimeRecordModel>> getTimeRecordsFromCurrentDay(String cpf) =>
      _timeRecordRepository.getTimeRecordsFromCurrentDay(cpf);

  @override
  Future<TimeRecordModel> getTimeRecord(int timeRecordId) =>
      _timeRecordRepository.getTimeRecord(timeRecordId);

  @override
  Future<void> createTimeRecord(TimeRecordModel timeRecordModel, String cpf) =>
      _timeRecordRepository.createTimeRecord(timeRecordModel, cpf);
}
