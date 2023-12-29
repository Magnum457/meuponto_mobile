import 'package:flutter_test/flutter_test.dart';

import 'package:meuponto_mobile/app/models/day_record_model.dart';

void main() {
  group('DayRecord Test', () {
    test('Construtor deve criar uma instância válida', () {
      DayRecordModel dayRecord = DayRecordModel(
        id: 1,
        referenceDate: DateTime.now(),
      );

      expect(dayRecord.id, 1);
      expect(dayRecord.referenceDate, isNotNull);
    });

    test('toMap deve retornar um mapa válido.', () {
      final dayRecord = DayRecordModel(
        id: 1,
        referenceDate: DateTime.now(),
      );
      final dayRecordMap = dayRecord.toMap();

      expect(dayRecordMap['id'], 1);
      expect(dayRecordMap['reference_date'], isNotNull);
    });

    test('fromMap deve receber um map e retornar um dayRecordModel', () {
      final dayRecordMap = {
        'id': 1,
        'reference_date': DateTime.now().toIso8601String(),
      };
      final dayRecord = DayRecordModel.fromMap(dayRecordMap);

      expect(dayRecord.id, dayRecordMap['id']);
      expect(dayRecord.referenceDate,
          DateTime.parse(dayRecordMap['reference_date'] as String));
    });

    test(
        'toJson e fromJson devem ser consistentes em transformar em Json e retransformar em model',
        () {
      final dayRecord = DayRecordModel(
        id: 1,
        referenceDate: DateTime.now(),
      );
      final dayRecordJson = dayRecord.toJson(dayRecord);
      final newDayRecord = DayRecordModel.fromJson(dayRecordJson);
      expect(newDayRecord.referenceDate, dayRecord.referenceDate);
    });

    test('Teste para a função getReferenceDate', () {
      DayRecordModel dayRecord = DayRecordModel(
        id: 1,
        referenceDate: DateTime(2023, 9, 18),
      );

      expect(dayRecord.getReferenceDate(), equals('18/09/2023'));
    });
  });
}
