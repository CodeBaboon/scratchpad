import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'location_screen.dart';

const kAppId = '9b0d55343fcd764d48461f9d91302edd';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper network = NetworkHelper(
      'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&APPID=$kAppId',
    );

    dynamic weatherData = await network.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  void getData() async {}

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
