import 'package:flutter_test/flutter_test.dart';

import '../../../lib/app/models/user_model.dart';

void main() {
  group('UserModel Test', () {
    test('Construtor deve criar uma instância válida', () {
      final user = UserModel(id: 1, nome: 'John Doe', cpf: '12345678910');
      expect(user.id, 1);
      expect(user.nome, 'John Doe');
      expect(user.cpf, '12345678910');
      expect(user.token, isNull);
    });

    test('Construtor vazio deve criar uma instância com valores padrão', () {
      final user = UserModel.empty();
      expect(user.id, 0);
      expect(user.nome, '');
      expect(user.cpf, '');
      expect(user.token, isNull);
    });

    test('toMap deve retornar um mapa válido.', () {
      final user = UserModel(id: 1, nome: 'John Doe', cpf: '12345678910');
      final userMap = user.toMap();
      expect(userMap['id'], 1);
      expect(userMap['nome'], 'John Doe');
      expect(userMap['cpf'], '12345678910');
      expect(userMap['token'], isNull);
    });

    test('fromMap deve crair uma instância válida a partir de um mapa.', () {
      final userMap = {
        'id': 1,
        'nome': 'John Doe',
        'cpf': '12345678910',
        'token': null,
      };
      final user = UserModel.fromMap(userMap);
      expect(user.id, 1);
      expect(user.nome, 'John Doe');
      expect(user.cpf, '12345678910');
      expect(user.token, isNull);
    });

    test('toJson e fromJson devem ser consistentes', () {
      final user = UserModel(id: 1, nome: 'John Doe', cpf: '12345678910');
      final userJson = user.toJson();
      final newUser = UserModel.fromJson(userJson);
      expect(newUser.id, user.id);
      expect(newUser.nome, user.nome);
      expect(newUser.cpf, user.cpf);
      expect(newUser.token, isNull);
    });
  });
}
