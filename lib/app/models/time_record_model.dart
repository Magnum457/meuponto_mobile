import 'dart:convert';

import '../models/register_type_model.dart';

class TimeRecordModel {
  int id;
  DateTime? time;
  String ip;
  String latitude;
  String longitude;
  RegisterTypeModel registerType;

  TimeRecordModel({
    required this.id,
    this.time,
    required this.ip,
    required this.latitude,
    required this.longitude,
    required this.registerType,
  }) {
    time = time ?? DateTime.now();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time,
      'ip': ip,
      'latitude': latitude,
      'longitude': longitude,
      'register_type': registerType,
    };
  }

  factory TimeRecordModel.fromMap(Map<String, dynamic> map) {
    var timeRecord = TimeRecordModel(
      id: map['id'],
      time: DateTime.parse(map['time']),
      ip: map['ip'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      registerType: RegisterTypeModel.fromMap(map['register_type']),
    );
    return timeRecord;
  }

  String toJson(TimeRecordModel timeRecordModel) {
    var timeRecordMap = {
      'id': timeRecordModel.id,
      'time': timeRecordModel.time?.toIso8601String(),
      'ip': timeRecordModel.ip,
      'latitude': timeRecordModel.latitude,
      'longitude': timeRecordModel.longitude,
      'register_type': timeRecordModel.registerType,
    };
    return json.encode(timeRecordMap);
  }

  factory TimeRecordModel.fromJson(String source) {
    var timeRecordEncoded = json.decode(source);
    var timeRecordMap = {
      'id': timeRecordEncoded['id'],
      'time': timeRecordEncoded['time'],
      'ip': timeRecordEncoded['ip'],
      'latitude': timeRecordEncoded['latitude'],
      'longitude': timeRecordEncoded['longitude'],
      'register_type':
          RegisterTypeModel.fromJson(timeRecordEncoded['register_type']),
    };
    var timeRecord = TimeRecordModel.fromMap(timeRecordMap);
    return timeRecord;
  }

  String getHorasMinutos() {
    String horas = time!.hour.toString().padLeft(2, '0');
    String minutos = time!.minute.toString().padLeft(2, '0');

    return '$horas:$minutos';
  }
}
