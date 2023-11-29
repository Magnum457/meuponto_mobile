import 'package:flutter_test/flutter_test.dart';

import 'package:meuponto_mobile/app/models/day_record_model.dart';

void main() {
  group('DayRecord Test', () {
    test('Construtor deve criar uma instância válida', () {
      DayRecordModel dayRecord = DayRecordModel(
        referenceDate: DateTime.now(),
      );

      expect(dayRecord.referenceDate, isNotNull);
    });

    test('toMap deve retornar um mapa válido.', () {
      final dayRecord = DayRecordModel(
        referenceDate: DateTime.now(),
      );
      final dayRecordMap = dayRecord.toMap();

      expect(dayRecordMap['reference_date'], isNotNull);
    });

    test('fromMap deve receber um map e retornar um dayRecordModel', () {
      final dayRecordMap = {
        'reference_date': DateTime.now(),
      };
      final dayRecord = DayRecordModel.fromMap(dayRecordMap);

      expect(dayRecord.referenceDate, isNotNull);
    });

    test(
        'toJson e fromJson devem ser consistentes em transformar em Json e retransformar em model',
        () {
      final dayRecord = DayRecordModel(referenceDate: DateTime.now());
      final dayRecordJson = dayRecord.toJson(dayRecord);
      final newDayRecord = DayRecordModel.fromJson(dayRecordJson);
      expect(newDayRecord.referenceDate, dayRecord.referenceDate);
    });
  });
}
