import 'ip_response.dart';

abstract class IpHandler {
  Future<IpResponse?> getIp();
}
