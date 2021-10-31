import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:hackolantern/main.dart';
import 'package:latlong/latlong.dart' as ltlg;
import 'data.dart';

class FindRoute extends StatefulWidget {
  const FindRoute({ Key key }) : super(key: key);

  @override
  _FindRouteState createState() => _FindRouteState();
}

class _FindRouteState extends State<FindRoute> {

  @override
  void initState() {
    getDirections();
    super.initState();
  }

  double getDistance(lat1, long1, {lat2, long2}) {
    if (lat2 == null) {
      lat2 = Data.locationData.latitude;
      long2 = Data.locationData.longitude;
    }
    final ltlg.Distance distance = new ltlg.Distance();
    final double distanceBetween = distance.as(
      ltlg.LengthUnit.Meter,
      ltlg.LatLng(lat1, long1),
      ltlg.LatLng(lat2, long2),
    );
    print(distanceBetween);
    return distanceBetween;
  }

  void getDirections() async {
    String googleAPIKey = "";
    Data.pathPoints.clear();

    PolylinePoints polylinePoints = PolylinePoints();
    Data.reports.sort((a,b) => getDistance(a.latitude, a.longitude).compareTo(getDistance(b.latitude, b.longitude)));
    List<Report> reportsCopy = [...Data.reports];

    Data.selectedCandies.forEach((element) {
      if(reportsCopy.indexWhere((e) => element.name == e.candy.name) != -1) {
        int i = reportsCopy.indexWhere((e) => element.name == e.candy.name);
        Data.waypoints.add(reportsCopy[i]);
        reportsCopy.removeAt(i);
      } else {
        print("Couldn't find ${element.name}");
      }
    });

    Data.waypoints.sort((a,b) => getDistance(a.latitude, a.longitude).compareTo(getDistance(b.latitude, b.longitude)));
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIKey,
      PointLatLng(Data.locationData.latitude, Data.locationData.longitude), 
      PointLatLng(Data.waypoints.last.latitude, Data.waypoints.last.longitude), 
      wayPoints: Data.waypoints.getRange(0, Data.waypoints.length-1).map((e) => PolylineWayPoint(location: e.latitude.toString() + ',' + e.longitude.toString())).toList(),
      travelMode: TravelMode.walking
    );

    Data.pathPoints = result.points;

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Finding route")
      ),
    );
  }
}