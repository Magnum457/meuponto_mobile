import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meuponto_mobile/app/modules/splash/splash_module.dart';

void main() {
  setUpAll(() {
    initModule(SplashModule());
  });
}
