import 'locator_response.dart';

abstract class Locator {
  Future<LocatorResponse?> getLocation();
}
