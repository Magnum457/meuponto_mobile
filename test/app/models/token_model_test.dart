import 'package:flutter_test/flutter_test.dart';

import 'package:meuponto_mobile/app/models/token_model.dart';

void main() {
  group('TokenModel Test', () {
    test('Construtor deve criar uma instância válida', () {
      final dateExpiration = DateTime.now();
      final token = TokenModel(
        accessToken: 'accessToken',
        refreshToken: 'refreshToken',
        expirationTime: dateExpiration,
      );
      expect(token.accessToken, 'accessToken');
      expect(token.refreshToken, 'refreshToken');
      expect(token.expirationTime, dateExpiration);
    });

    test('toMap deve retornar um mapa válido.', () {
      final dateExpiration = DateTime.now();
      final token = TokenModel(
        accessToken: 'accessToken',
        refreshToken: 'refreshToken',
        expirationTime: dateExpiration,
      );
      final tokenMap = token.toMap();
      expect(tokenMap['accessToken'], 'accessToken');
      expect(tokenMap['refreshToken'], 'refreshToken');
      expect(tokenMap['expirationTime'], dateExpiration);
    });

    test('fromMap deve criar uma instância válida a partir de um mapa.', () {
      final dateExpiration = DateTime.now();
      final tokenMap = {
        'accessToken': 'accessToken',
        'refreshToken': 'refreshToken',
        'expirationTime': dateExpiration,
      };
      final token = TokenModel.fromMap(tokenMap);
      expect(token.accessToken, 'accessToken');
      expect(token.refreshToken, 'refreshToken');
      expect(token.expirationTime, dateExpiration);
    });

    test('toJson e fromJson devem ser consistentes', () {
      final dateExpiration = DateTime.now();
      final originalToken = TokenModel(
        accessToken: 'accessToken',
        refreshToken: 'refreshToken',
        expirationTime: dateExpiration,
      );
      final tokenJson = originalToken.toJson();
      final newToken = TokenModel.fromJson(tokenJson);

      expect(newToken.accessToken, originalToken.accessToken);
      expect(newToken.refreshToken, originalToken.refreshToken);
      expect(newToken.expirationTime, originalToken.expirationTime);
    });
  });
}
