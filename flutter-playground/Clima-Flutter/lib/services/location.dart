import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    late LocationPermission permission;

    try {
      final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (serviceEnabled) {
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }
      }
      if (permission != LocationPermission.denied &&
          permission != LocationPermission.deniedForever) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
        );

        latitude = position.latitude;
        longitude = position.longitude;
      } else {
        print(permission);
      }
    } catch (e) {
      print(e);
      latitude = 0;
      longitude = 0;
    }
  }
}
