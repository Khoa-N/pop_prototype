import 'package:flutter/material.dart';
import 'package:mapbox_gl/controller.dart';
import 'package:mapbox_gl/flutter_mapbox.dart';
import 'package:mapbox_gl/overlay.dart';

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new MapboxOverlay(
        controller: new MapboxOverlayController(),
        options: new MapboxMapOptions(
          style: Style.mapboxStreets,
          camera: new CameraPosition(
            target: new LatLng(lat: 29.751280, lng: -95.480500),
            zoom: 15.0,
            bearing: 0.0,
            tilt: 0.0,
          ),
        ),
      ),
    );
  }
}
