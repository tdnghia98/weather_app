import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  final apiKey = 'b9078b1edbe5ded723c7dd73894ceb5a';

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    final String url =
        'https://api.openweathermap.org/data/2.5/weather?lat${location.latitude}&lon=${location.longitude}&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    print(weatherData);
    print('${location.latitude}, ${location.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: getLocation,
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
