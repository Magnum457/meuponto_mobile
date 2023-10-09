import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meuponto_mobile/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: 350,
            height: 55,
            child: Text(
              'Funcionário online',
              textAlign: TextAlign.center,
              style: GoogleFonts.kanit(
                color: Theme.of(context).primaryColor,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          TextButton(
            onPressed: () => setState(() {
              Modular.to.pushNamed('/');
            }),
            child: const Text('Entrar com o identidade'),
          ),
        ],
      ),
    );
  }
}
