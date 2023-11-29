import 'package:flutter_test/flutter_test.dart';

import 'package:meuponto_mobile/app/models/time_record_model.dart';

void main() {
  group('TimeRecord Test', () {
    test('Construtor deve criar uma instância válida', () {
      TimeRecordModel timeRecord = TimeRecordModel(
        registerType: 'Entrada',
      );

      expect(timeRecord.time, isNotNull);
      expect(timeRecord.registerType, 'Entrada');
    });

    test('toMap deve retornar um mapa válido.', () {
      final timeRecord = TimeRecordModel(
        registerType: 'Entrada',
      );
      final timeRecordMap = timeRecord.toMap();

      expect(timeRecordMap['time'], isNotNull);
      expect(timeRecordMap['register_type'], timeRecord.registerType);
    });

    test('fromMap deve receber um map e retornar um timeRecordModel', () {
      final timeRecordMap = {
        'time': DateTime.now(),
        'register_type': 'Entrada',
      };
      final timeRecord = TimeRecordModel.fromMap(timeRecordMap);

      expect(timeRecord.time, timeRecordMap['time']);
      expect(timeRecord.registerType, timeRecordMap['register_type']);
    });

    test(
        'toJson e fromJson devem ser consistentes em transformar em Json e retransformar em model',
        () {
      final timeRecord = TimeRecordModel(registerType: 'Entrada');
      final timeRecordJson = timeRecord.toJson(timeRecord);
      final newTimeRecord = TimeRecordModel.fromJson(timeRecordJson);
      expect(newTimeRecord.time, timeRecord.time);
      expect(newTimeRecord.registerType, timeRecord.registerType);
    });
  });
}
