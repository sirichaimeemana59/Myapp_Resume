import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longtitue;

  Future<void> getLocation() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longtitue = position.longitude;
      } catch (e) {
        print(e);
      }
    }
    // return await Geolocator.getCurrentPosition();
  }
}
