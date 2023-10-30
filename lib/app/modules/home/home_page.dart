import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meuponto_mobile/app/core/extensions/theme_extension.dart';
import 'package:meuponto_mobile/app/core/ui/widgets/side_menu.dart';
import 'package:meuponto_mobile/app/modules/home/widgets/servico_dialog_widget.dart';
import 'package:meuponto_mobile/app/modules/home/home_store.dart';

import '../../core/life_cycle/page_life_cicle_state.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeStore, HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: Observer(
          builder: (_) => RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Olá, ${store.loggedUser?.nome ?? 'Usuário'}. ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextSpan(
                  text: '\nBem vindo ao Meu Ponto',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
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
      drawer: Observer(
        builder: (_) => SideMenu(
          nome: store.loggedUser?.nome ?? 'Usuário',
          cpf: store.loggedUser?.cpf ?? '',
          logout: () async {
            await store.logout();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Serviços',
                    style: GoogleFonts.kanit(
                      color: const Color(0xFF405965),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 20),
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
                      descricao: 'Atualizar contato',
                      emBreve: true,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
