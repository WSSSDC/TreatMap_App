import 'package:flutter/material.dart';
import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:location/location.dart';

class AppleMapsExample extends StatelessWidget {
  AppleMapController mapController;

  void _onMapCreated(AppleMapController controller) async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    print(_locationData);

    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
            child: AppleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(0.0, 0.0),
              ),
              trackingMode: TrackingMode.follow,
              polylines: Set<Polyline>.of(
                  [
                    Polyline(
                      polylineId: PolylineId("polyline"),
                      visible: true,
                      points: [
                        LatLng(37.42796133580664, -122.085749655962),
                        LatLng(37.3298984914041, -122.033492279053),
                        LatLng(37.52535448487861, -122.0574035644531),
                        LatLng(37.3298984914041, -122.033492279053),
                      ],
                      width: 10,
                      color: Colors.red,
                      jointType: JointType.bevel,
                      patterns: [PatternItem.dash(10)],
                    ),
                  ]
              ),
            ),
          ),
        ),
      ],
    );
  }
}