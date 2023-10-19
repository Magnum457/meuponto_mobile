import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meuponto_mobile/app/core/extensions/theme_extension.dart';
import 'package:meuponto_mobile/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 80),
          Text(
            'Funcionário online',
            textAlign: TextAlign.center,
            style: GoogleFonts.kanit(
              color: Theme.of(context).primaryColor,
              fontSize: 45,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 50),
          Container(
            width: 325,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 24),
              child: ElevatedButton(
                onPressed: () async {
                  store.loginIdentidade(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Entrar com identidade',
                  style: context.textTheme.displayMedium,
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
          TextButton(
            onPressed: () {
              debugPrint('Alterando a senha');
            },
            child: Text(
              'Alterar senha',
              style: context.textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              debugPrint('Desbloqueando a conta');
            },
            child: Text(
              'Desbloquear conta',
              style: context.textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/detran_logo.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 140,
            width: 140,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo_ceara.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
