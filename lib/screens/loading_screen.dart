import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
    getWeatherData(location.latitude, location.longitude);
  }

  void getWeatherData(double lat, double long) async {
    Networking network = Networking();
    String url =
        'https://samples.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=439d4b804bc8187953eb36d2a8c26a02';
    await network.performGetRequest(url, (String response) {
      print(response);
    }, (String error) {
      print(error);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold();
  }
}
