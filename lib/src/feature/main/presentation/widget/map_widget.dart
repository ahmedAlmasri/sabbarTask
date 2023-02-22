import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'markers.dart';

class MapWidget extends StatelessWidget {
  final void Function(GoogleMapController) _onMapCreated;
  final LatLng _deliveryPosition;
  final LatLng _pickupPosition;
  final LatLng _driverPosition;
   MapWidget({
    super.key,
    required LatLng deliveryPosition,
    required LatLng pickupPosition,
    required LatLng driverPosition,
    required void Function(GoogleMapController) onMapCreated,
  })  : _onMapCreated = onMapCreated,
        _deliveryPosition = deliveryPosition,
        _pickupPosition = pickupPosition,
        _driverPosition = driverPosition;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) async {
        _onMapCreated(controller);
      },
      initialCameraPosition: CameraPosition(target: _driverPosition),
      circles: {
        pickupMarker,
        deliveryMarker,
      },
      markers: {
        Marker(
          markerId: const MarkerId("delivery_location"),
          position: _driverPosition,
        )
      },
    );
  }
}
