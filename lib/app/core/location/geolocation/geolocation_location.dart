import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../../../core/ui/widgets/messages.dart';

import '../locator_response.dart';
import '../locator.dart';

class GeolocationLocator implements Locator {
  Future<bool> _handleServiceLocation() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Messages.alert(
          "Serviço de localização está desativado. Por favor habilite a localização do seu dispositivo.");
      return false;
    }
    return true;
  }

  Future<bool> _handleLocationPermission() async {
    LocationPermission permission;

    if (await _handleServiceLocation()) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Messages.alert('As permissões de localização não foram permitidos.');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Messages.alert(
          'As permissões de localização estão permanentemente negadas, não podemos requisitar a sua localização.');
      return false;
    }
    return true;
  }

  Future<String> _getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      return "${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}";
    } catch (e) {
      Messages.alert(e.toString());
      return "";
    }
  }

  @override
  Future<LocatorResponse?> getLocation() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return null;
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      String address = await _getAddressFromLatLng(position);
      return LocatorResponse(
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString(),
        address: address,
      );
    } catch (e) {
      Messages.alert(e.toString());
      return null;
    }
  }
}
