import 'dart:convert';

import '../models/register_type_model.dart';

class TimeRecordModel {
  int? id;
  DateTime? time;
  String ip;
  String latitude;
  String longitude;
  String? address;
  RegisterTypeModel registerType;

  TimeRecordModel({
    this.id,
    this.time,
    required this.ip,
    required this.latitude,
    required this.longitude,
    this.address,
    required this.registerType,
  }) {
    time = adjustTimeStamp(time) ?? DateTime.now().toLocal();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time,
      'ip': ip,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
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
      address: map['address'] ?? '',
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
      'address': timeRecordModel.address,
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
      'address': timeRecordEncoded['address'],
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

  DateTime? adjustTimeStamp(DateTime? time) {
    if (time != null) {
      return time.toLocal();
    }
    return null;
  }
}
