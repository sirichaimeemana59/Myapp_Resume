import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longtitue;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longtitue = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
