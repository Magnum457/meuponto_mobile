import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  Color get cinzaVerdeEscuro => const Color.fromARGB(255, 109, 127, 136);
  Color get verdeTitulo => const Color.fromARGB(255, 106, 193, 145);
  Color get verdeTituloClaro => const Color.fromARGB(255, 64, 185, 140);
  Color get verdeCinzaCard => const Color.fromARGB(255, 193, 211, 194);
  Color get verdeCinzaCardClaro => const Color.fromARGB(255, 233, 242, 234);
  Color get badgeAlerta => const Color.fromARGB(255, 170, 63, 63);
  Color get badgeSucesso => const Color.fromARGB(255, 55, 158, 101);
  Color get badgeWarning => const Color.fromARGB(255, 192, 172, 58);
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorDark => Theme.of(this).primaryColorDark;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
