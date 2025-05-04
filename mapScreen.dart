import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapScreen extends StatelessWidget {
  final String accessToken = 'YOUR_MAPBOX_ACCESS_TOKEN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map View')),
      body: MapboxMap(
        accessToken: accessToken,
        initialCameraPosition: CameraPosition(
          target: LatLng(33.774, -84.296), // Coordinates for Decatur, GA
          zoom: 12,
        ),
      ),
    );
  }
}
