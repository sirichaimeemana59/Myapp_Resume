import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class GoogleMapUIHome extends StatefulWidget {
  @override
  _GoogleMapUIHomeState createState() => _GoogleMapUIHomeState();
}

class _GoogleMapUIHomeState extends State<GoogleMapUIHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('google'.tr),
        backgroundColor: Colors.grey.shade400,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(32.8),
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: FlutterMap(
                    options: MapOptions(
                        // center: LatLng(222, 222),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
