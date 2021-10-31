import 'package:flutter/material.dart';
import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:latlong/latlong.dart' as ltlg;
import 'package:hackolantern/data.dart';
import 'package:location/location.dart';

class AppleMapsExample extends StatefulWidget {
  @override
  _AppleMapsExampleState createState() => _AppleMapsExampleState();
}

class _AppleMapsExampleState extends State<AppleMapsExample> {
  AppleMapController mapController;

  LocationData _locationData;

  void _onMapCreated(AppleMapController controller) async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    
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
    Data.locationData = _locationData;
    location.onLocationChanged.listen((LocationData currentLocation) {
      if(points.isNotEmpty) checkPoints(_locationData);
    });

    mapController = controller;
  }

  List<PointLatLng> points = [];

  checkPoints(_newLocation) {
    //Get distance between _locationData and first point
    final ltlg.Distance distance = new ltlg.Distance();
    final double distanceBetween = distance.as(
      ltlg.LengthUnit.Meter,
      ltlg.LatLng(points[0].latitude, points[0].longitude),
      new ltlg.LatLng(_locationData.latitude, _locationData.longitude),
    );

    if (distanceBetween < 10) {
      points.removeAt(0);
      setState(() => points);
    }
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
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: false,
              trackingMode: TrackingMode.followWithHeading,
              annotations: Data.reports.map((e) => Annotation(
                annotationId: AnnotationId(UniqueKey().toString()),
                icon: BitmapDescriptor.markerAnnotation,
                infoWindow: InfoWindow(
                  title: e.candy.name,
                ),
                position: LatLng(e.latitude, e.longitude),
              )).toSet(),
              // onCameraIdle: () {
              //   mapController.animateCamera(
              //     CameraUpdate.newCameraPosition(
              //       CameraPosition(
              //         target: LatLng(
              //           _locationData.latitude,
              //           _locationData.longitude,
              //         ),
              //         zoom: 15.0,
              //       ),
              //     ),
              //   );
              // },
              polylines: Set<Polyline>.of(
                  [
                    Polyline(
                      polylineId: PolylineId("polyline"),
                      color: Color.fromRGBO(0, 122, 255, 0.5),
                      visible: true,
                      points: Data.pathPoints.map((e) => LatLng(e.latitude, e.longitude)).toList(),
                      width: 4,
                      jointType: JointType.round,
                      polylineCap: Cap.roundCap,
                      patterns: [PatternItem.dot, PatternItem.gap(20)],
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