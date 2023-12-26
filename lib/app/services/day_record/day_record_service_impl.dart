import 'package:meuponto_mobile/app/models/day_record_model.dart';
import 'package:meuponto_mobile/app/repositories/day_record/day_record_repository.dart';

import 'day_record_service.dart';

class DayRecordServiceImpl implements DayRecordService {
  final DayRecordRepository _dayRecordRepository;

  DayRecordServiceImpl({required DayRecordRepository dayRecordRepository})
      : _dayRecordRepository = dayRecordRepository;

  @override
  Future<List<DayRecordModel>> getDayRecords(String cpf) =>
      _dayRecordRepository.getDayRecords(cpf);

  @override
  Future<DayRecordModel> getDayRecord(int dayRecordId) =>
      _dayRecordRepository.getDayRecord(dayRecordId);
}
