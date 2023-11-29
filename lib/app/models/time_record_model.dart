import 'dart:convert';

class TimeRecordModel {
  DateTime? time;
  final String registerType;

  TimeRecordModel({
    this.time,
    required this.registerType,
  }) {
    time = time ?? DateTime.now();
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'register_type': registerType,
    };
  }

  factory TimeRecordModel.fromMap(Map<String, dynamic> map) {
    var timeRecord = TimeRecordModel(
      time: map['time'],
      registerType: map['register_type'],
    );
    return timeRecord;
  }

  String toJson(TimeRecordModel timeRecordModel) {
    var timeRecordMap = {
      'time': timeRecordModel.time?.toIso8601String(),
      'register_type': timeRecordModel.registerType,
    };
    return json.encode(timeRecordMap);
  }

  factory TimeRecordModel.fromJson(String source) {
    var timeRecordDecoded = json.decode(source);
    var timeRecordMap = {
      'time': DateTime.parse(timeRecordDecoded['time']),
      'register_type': timeRecordDecoded['register_type'],
    };
    var timeRecord = TimeRecordModel.fromMap(timeRecordMap);
    return timeRecord;
  }
}
