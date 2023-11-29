import 'dart:convert';

import 'time_record_model.dart';

class DayRecordModel {
  DateTime referenceDate;
  List<TimeRecordModel>? timeRecord;

  DayRecordModel({
    required this.referenceDate,
    this.timeRecord,
  });

  Map<String, dynamic> toMap() {
    return {
      'reference_date': referenceDate,
      'timeRecord': timeRecord,
    };
  }

  factory DayRecordModel.fromMap(Map<String, dynamic> map) {
    var dayRecord = DayRecordModel(
      referenceDate: map['reference_date'],
      timeRecord: map['time_record'],
    );
    return dayRecord;
  }

  String toJson(DayRecordModel dayRecordModel) {
    var dayRecordMap = {
      'reference_date': dayRecordModel.referenceDate.toIso8601String(),
    };
    return json.encode(dayRecordMap);
  }

  factory DayRecordModel.fromJson(String source) {
    var dayRecordDecoded = json.decode(source);
    var dayRecordMap = {
      'reference_date': DateTime.parse(dayRecordDecoded['reference_date']),
    };
    var dayRecord = DayRecordModel.fromMap(dayRecordMap);
    return dayRecord;
  }
}
