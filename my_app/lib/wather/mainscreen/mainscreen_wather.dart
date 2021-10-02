import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'location.dart';
import 'package:http/http.dart' as http;

const apiKey = 'cdf10771878e923b6abfc2e307ef377a';

class MainWhather extends StatefulWidget {
  @override
  _MainWhatherState createState() => _MainWhatherState();
}

class _MainWhatherState extends State<MainWhather> {
  double latitude;
  double longtitue;
  var longitude;
  var latgitude;
  var discriptionText;
  var temperatureText;
  var conditionText;
  var citiNameText;

  void initState() {
    super.initState();
    getDataLocation();
  }

  void getDataLocation() async {
    Location location = Location();
    await location.getLocation();
    latitude = location.latitude;
    longtitue = location.longtitue;
    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$apiKey'));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      var longitude = decodeData['coord']['lon'];
      var latgitude = decodeData['coord']['lat'];
      var discription = decodeData['weather'][0]['description'];

      double temperature = decodeData['main']['temp'];
      int condition = decodeData['weather'][0]['id'];
      String citiName = decodeData['name'];
      setState(() {
        discriptionText = discription;
        temperatureText = temperature;
        citiNameText = citiName;
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wather'.tr),
        backgroundColor: HexColor('#4388E5'),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  getDataLocation();
                },
                child: Text('Get Location'),
              ),
              Column(
                children: [
                  Text(citiNameText.toString()),
                  Text(discriptionText.toString()),
                  Text(temperatureText.toString()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
