import 'package:flutter/material.dart';

import '../../core/extensions/theme_extension.dart';

import '../../core/ui/widgets/custom_app_bar.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Política e Termos de Uso'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Center(
              child: Text(
                'Política de Privacidade',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Última atualização: 26 de outubro de 2023',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '''Bem-vindo ao aplicativo MEUDETRAN do Departamento Estadual de Trânsito do Estado do Ceará (DETRAN-CE). 
                Este aplicativo foi desenvolvido para fornecer informações e serviços relacionados ao trânsito e à segurança viária no estado do Ceará. 
                A sua privacidade e a segurança de seus dados são fundamentais para nós. 
                Leia atentamente esta Política de Privacidade e Termos de Uso para entender como tratamos as informações que você fornece ao usar nosso aplicativo.''',
              //texto justificado
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Roboto', color: Colors.black54),
            ),
            const SizedBox(height: 20),
            const Text(
              '1. Informações Coletadas',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '1.1. Dados Pessoais',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '''Para acessar e utilizar os recursos do aplicativo MEU PONTO, você pode ser solicitado a fornecer informações pessoais, 
                  como CPF, RG e outros dados identificáveis. 
                  Esses dados são necessários para autenticar sua identidade e fornecer serviços personalizados.''',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '1.2. Informações de Localização',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '''Podemos coletar informações de localização do seu dispositivo para oferecer serviços baseados em localização, 
                como encontrar postos de atendimento, unidades de trânsito ou informações sobre congestionamentos.''',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '1.4. Dados de Uso',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '''Coletamos informações sobre como você interage com o aplicativo, 
                incluindo as páginas que visita, as ações que realiza e o tempo gasto em cada área. 
                Isso nos ajuda a melhorar o aplicativo e aprimorar a experiência do usuário.''',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '1.5. Dados de Login',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '''Para acessar algumas áreas do aplicativo, você precisará criar uma conta no sistema IDENTIDADE. 
                Essas informações são armazenadas com segurança e usadas para autenticação.''',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '2. Uso das Informações',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '2.1. Fins Legais',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '''As informações coletadas são usadas para fins legais, como fornecer serviços de trânsito, 
                cumprir regulamentos governamentais, processar transações relacionadas a veículos, 
                gerenciar infrações e melhorar a segurança viária.''',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '2.2. Comunicações',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '''Podemos usar suas informações para enviar atualizações, 
                notícias e informações importantes relacionadas ao trânsito e aos serviços do DETRAN-CE. 
                Você pode optar por não receber comunicações a qualquer momento.''',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Termos de Uso',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              // Inserir o texto dos Termos de Uso aqui
              '''Ao usar o aplicativo DETRAN-CE, você concorda com esta Política de Privacidade e Termos de Uso. 
              Certifique-se de revisá-los regularmente para estar ciente de qualquer atualização. 
              Obrigado por escolher o aplicativo DETRAN-CE para suas necessidades relacionadas ao trânsito e à segurança viária no estado do Ceará.''',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.primaryColorDark,
              ),
              onPressed: () {
                // Ação ao clicar no botão de aceitar
                // Por exemplo, você pode navegar de volta para a tela principal.
                Navigator.pop(context);
              },
              child: const Text(
                'Aceitar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
