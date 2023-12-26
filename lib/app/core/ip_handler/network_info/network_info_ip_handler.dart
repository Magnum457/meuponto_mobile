import 'package:meuponto_mobile/app/core/ip_handler/ip_response.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../../../core/ui/widgets/messages.dart';

import '../ip_handler.dart';

class NetworkInfoIpHandler implements IpHandler {
  @override
  Future<IpResponse?> getIp() async {
    try {
      final info = NetworkInfo();
      final ip = await info.getWifiIP();
      final ipv6 = await info.getWifiIPv6();

      return IpResponse(
        ip: ip,
        ipv6: ipv6,
      );
    } catch (e) {
      Messages.alert(e.toString());
      return null;
    }
  }
}
