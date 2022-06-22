// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, annotate_overrides

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Get Location'),
        ),
        body: WeatherAppHomePage(),
      ),
    ),
  );
}

class WeatherAppHomePage extends StatefulWidget {
  WeatherAppHomePage({Key? key}) : super(key: key);

  @override
  State<WeatherAppHomePage> createState() => _WeatherAppHomePageState();
}

class _WeatherAppHomePageState extends State<WeatherAppHomePage> {
  double longitude = 0.0;
  double latitude = 0.0;
  double temperatue = 0.0;
  double temperatue_max = 0.0;
  double temperatue_min = 0.0;
  String name = '';
  String description = '';
  @override
  void initState() {
    FetchLocation();
    // FetchWeather();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Temperature: ',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                temperatue.toStringAsFixed(2),
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Feels Like: ',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                name.toString(),
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Max Temperature: ',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                temperatue_max.toStringAsFixed(2),
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Min Temperature: ',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                temperatue_min.toStringAsFixed(2),
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Description: ',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                description.toString(),
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void FetchLocation() async {
    bool permission = false;
    LocationPermission checkpermission = await Geolocator.checkPermission();
    if (checkpermission == LocationPermission.denied ||
        checkpermission == LocationPermission.deniedForever) {
      LocationPermission reqpermission = await Geolocator.requestPermission();
      print(reqpermission);
      if (reqpermission == LocationPermission.whileInUse ||
          reqpermission == LocationPermission.always) {
        permission = true;
      }
    } else {
      permission = true;
    }
    if (permission) {
      Position location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      longitude = location.longitude;
      latitude = location.latitude;
      print(location);
      FetchWeather();
    } else {
      print('Location permision denied.');
    }
  }

  void FetchWeather() async {
    const String Api_Key = "e1b388210119d1e9b9d4e3e80d5f69fa";
    String urlString =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$Api_Key";
    var url = Uri.parse(urlString);
    http.Response response = await http.get(url);
    var responseBody = response.body;
    var parsedResponse = json.decode(responseBody);
    setState(() {
      temperatue = parsedResponse['main']['temp'] - 273.15;
      temperatue_max = parsedResponse['main']['temp_max'] - 273.15;
      temperatue_min = parsedResponse['main']['temp_min'] - 273.15;
      name = parsedResponse['name'];
      description = parsedResponse['weather'][0]['description'];
    });
  }
}
