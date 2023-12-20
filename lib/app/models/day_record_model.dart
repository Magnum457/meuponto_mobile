import 'dart:convert';

import 'time_record_model.dart';

class DayRecordModel {
  int id;
  DateTime referenceDate;
  List<TimeRecordModel>? timeRecords;

  DayRecordModel({
    required this.id,
    required this.referenceDate,
    this.timeRecords,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'reference_date': referenceDate,
      'timeRecord': timeRecords,
    };
  }

  factory DayRecordModel.fromMap(Map<String, dynamic> map) {
    var dayRecord = DayRecordModel(
      id: map['id'],
      referenceDate: DateTime.parse(map['reference_date']),
      timeRecords: map['time_records'] == null
          ? []
          : List<TimeRecordModel>.from(
              map['time_records']?.map(
                (timeRecord) => TimeRecordModel.fromMap(timeRecord),
              ),
            ),
    );
    return dayRecord;
  }

  String toJson(DayRecordModel dayRecordModel) {
    var dayRecordMap = {
      'id': dayRecordModel.id,
      'reference_date': dayRecordModel.referenceDate.toIso8601String(),
    };
    return json.encode(dayRecordMap);
  }

  factory DayRecordModel.fromJson(String source) {
    var dayRecordMap = json.decode(source);
    var dayRecord = DayRecordModel.fromMap(dayRecordMap);
    return dayRecord;
  }

  String getReferenceDate() {
    String dia = referenceDate.day.toString().padLeft(2, '0');
    String mes = referenceDate.month.toString().padLeft(2, '0');
    String ano = referenceDate.year.toString();

    String dataFormatada = '$dia/$mes/$ano';

    return dataFormatada;
  }

  String getDiaDaSemana() {
    int numeroDoDiaDaSemana = referenceDate.weekday;

    switch (numeroDoDiaDaSemana) {
      case 1:
        return 'Segunda-feira';
      case 2:
        return 'Terça-feira';
      case 3:
        return 'Quarta-feira';
      case 4:
        return 'Quinta-feira';
      case 5:
        return 'Sexta-feira';
      case 6:
        return 'Sábado';
      case 7:
        return 'Domingo';
      default:
        return 'Dia inválido';
    }
  }

  int pendingRecords() {
    return (4 - timeRecords!.length).abs();
  }
}
