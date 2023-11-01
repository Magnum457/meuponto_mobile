import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meuponto_mobile/app/core/extensions/size_screen_extension.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  }) : super();

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    _timeOut().then((_) {
      Modular.to.navigate('/login/');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _timeOut() async {
    await Future.delayed(const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash_fundo.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: const Scaffold(
              backgroundColor: Colors.transparent,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 150,
            child: Center(
              child: Container(
                height: 80.h,
                width: 163.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/detran_logo_texto.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            child: Container(
              height: 180.h,
              width: 250.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/logo_ceara_texto_branco.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
