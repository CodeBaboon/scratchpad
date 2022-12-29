import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/location.dart';

const kAppId = 'b6907d289e10d714a6e88b30761fae22';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('Latitude: ${location.latitude}, Longitude: ${location.longitude}');
  }

  void getData() async {
    final double lat = 37.78;
    final double lon = -122.41;
    final Uri uri = Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${kAppId}');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
