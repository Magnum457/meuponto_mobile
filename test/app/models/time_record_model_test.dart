import 'package:flutter_test/flutter_test.dart';

import 'package:meuponto_mobile/app/models/time_record_model.dart';
import 'package:meuponto_mobile/app/models/register_type_model.dart';

void main() {
  late RegisterTypeModel registerType;

  setUp(() {
    registerType = RegisterTypeModel(id: 1, descricao: 'Entrada');
  });
  group('TimeRecord Test', () {
    test('Construtor deve criar uma instância válida', () {
      TimeRecordModel timeRecord = TimeRecordModel(
        id: 1,
        ip: '172.25.137.31',
        latitude: '-0.3456',
        longitude: '0.6543',
        registerType: registerType,
      );

      expect(timeRecord.id, 1);
      expect(timeRecord.ip, '172.25.137.31');
      expect(timeRecord.latitude, '-0.3456');
      expect(timeRecord.longitude, '0.6543');
      expect(timeRecord.time, isNotNull);
      expect(timeRecord.registerType, registerType);
    });

    test('toMap deve retornar um mapa válido.', () {
      final timeRecord = TimeRecordModel(
        id: 1,
        ip: '172.25.137.31',
        latitude: '-0.3456',
        longitude: '0.6543',
        registerType: registerType,
      );
      final timeRecordMap = timeRecord.toMap();

      expect(timeRecordMap['id'], 1);
      expect(timeRecordMap['ip'], '172.25.137.31');
      expect(timeRecordMap['time'], isNotNull);
      expect(timeRecordMap['latitude'], '-0.3456');
      expect(timeRecordMap['longitude'], '0.6543');
      expect(timeRecordMap['register_type'], timeRecord.registerType);
    });

    test('fromMap deve receber um map e retornar um timeRecordModel', () {
      final timeRecordMap = {
        'id': 1,
        'ip': '172.25.137.31',
        'time': DateTime.now().toIso8601String(),
        'latitude': '-0.3456',
        'longitude': '0.6543',
        'register_type': registerType,
      };
      final timeRecord = TimeRecordModel.fromMap(timeRecordMap);

      expect(timeRecord.id, timeRecordMap['id']);
      expect(timeRecord.ip, timeRecordMap['ip']);
      expect(timeRecord.time, DateTime.parse(timeRecordMap['time'] as String));
      expect(timeRecord.latitude, timeRecordMap['latitude']);
      expect(timeRecord.longitude, timeRecordMap['longitude']);
      expect(timeRecord.registerType, timeRecordMap['register_type']);
    });

    test(
        'toJson e fromJson devem ser consistentes em transformar em Json e retransformar em model',
        () {
      final timeRecord = TimeRecordModel(
        id: 1,
        ip: '172.25.137.31',
        latitude: '-0.3456',
        longitude: '0.6543',
        registerType: registerType,
      );
      final timeRecordJson = timeRecord.toJson(timeRecord);
      final newTimeRecord = TimeRecordModel.fromJson(timeRecordJson);
      expect(newTimeRecord.id, timeRecord.id);
      expect(newTimeRecord.ip, timeRecord.ip);
      expect(newTimeRecord.time, timeRecord.time);
      expect(newTimeRecord.latitude, timeRecord.latitude);
      expect(newTimeRecord.longitude, timeRecord.longitude);
      expect(newTimeRecord.registerType, equals(timeRecord.registerType));
    });
  });
}
