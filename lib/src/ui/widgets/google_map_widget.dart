import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/src/ui/models/position_model.dart';

class GoogleMapWidget extends StatelessWidget {
  final MapCreatedCallback onMapCreated;
  final PositionModel position;

  const GoogleMapWidget({super.key, required this.onMapCreated, required this.position});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GoogleMap(
            zoomControlsEnabled: true,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            onMapCreated: onMapCreated,
            markers: {Marker(markerId: const MarkerId('1'), position: position.toLatLng)},
            initialCameraPosition: CameraPosition(target: position.toLatLng, zoom: 18)));
  }
}
