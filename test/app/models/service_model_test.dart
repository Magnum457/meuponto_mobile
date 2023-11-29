import 'package:flutter_test/flutter_test.dart';

import 'package:meuponto_mobile/app/models/service_model.dart';

void main() {
  group('UserModel Test', () {
    test('Construtor deve criar uma instância válida', () {
      final servico = ServiceModel(
        descricao: 'Serviço Novo',
        icon: 'Icone de Serviço',
        link: '/novo_servico/',
        emBreve: true,
      );
      expect(servico.descricao, 'Serviço Novo');
      expect(servico.icon, 'Icone de Serviço');
      expect(servico.link, '/novo_servico/');
      expect(servico.emBreve, true);
    });

    test('ToString deve retornar uma String válido.', () {
      final servico = ServiceModel(
        descricao: 'Serviço Novo',
        icon: 'Icone de Serviço',
        link: '/novo_servico/',
        emBreve: true,
      );
      expect(servico.toString(),
          'ServiceModel{descricao: Serviço Novo, icon: Icone de Serviço}');
    });
  });
}
