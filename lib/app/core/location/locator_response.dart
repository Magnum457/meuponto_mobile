class LocatorResponse {
  final String latitude;
  final String longitude;
  String? address;

  LocatorResponse({
    required this.latitude,
    required this.longitude,
    this.address,
  });
}
