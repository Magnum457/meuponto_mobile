import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meuponto_mobile/app/core/extensions/theme_extension.dart';
import 'package:meuponto_mobile/app/core/ui/widgets/side_menu.dart';
import 'package:meuponto_mobile/app/modules/home/widgets/servico_dialog_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Olá Usuário',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextSpan(
                text: '\n Bem vindo ao Meu Ponto',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color(0xFF405965),
              size: 30,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Divider(
            color: context.verdeCinzaCard,
            thickness: 1,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 60,
                  mainAxisSpacing: 20,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ServicoDialogWidget(
                    onTap: () {
                      debugPrint('Serviço');
                    },
                    descricao: 'Descricao do serviço',
                    emBreve: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
