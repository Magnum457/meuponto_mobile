import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meuponto_mobile/app/core/ui/ui_config.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular
      ..setObservers([Asuka.asukaHeroController])
      ..setInitialRoute('/');

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, __) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
        builder: Asuka.builder,
        title: UiConfig.appName,
        theme: UiConfig.theme,
      ),
    );
  }
}
