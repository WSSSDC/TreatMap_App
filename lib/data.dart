import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

class Data {
  static List<Report> reports = [
    Report(
      id: '012jdo0in10inbr',
      candy: Candy(name: 'KitKat', image: 'https://www.madewithnestle.ca/sites/default/files/styles/global_nav_image/public/nestle_categoty_choctreats-01-kitkat.png?itok=GZeMYvGJ'),
      latitude: 43.258331,
      longitude: -79.962107,
    ),
    Report(
      id: 'aidnlanlinea',
      candy:     Candy(name: "Reese's Cups", image: 'https://s7d2.scene7.com/is/image/hersheysassets/0_34000_00440_9_701_44000_136_Item_Front?fmt=png-alpha&hei=3000'),
      latitude: 43.256831,
      longitude: -79.958148,
    ),
    Report(
      id: 'nalfnael',
      candy: Candy(name: "Kinder Egg", image: 'https://www.kinder.com/ca/sites/kinder_ca/files/2019-11/chocolate-egg-kinder-surprise-20g-fr.png?t=1631039846'),
      latitude: 43.256237,
      longitude: -79.955765,
    ),
    Report(
      id: 'adnleainflae',
      candy: Candy(name: 'KitKat', image: 'https://www.madewithnestle.ca/sites/default/files/styles/global_nav_image/public/nestle_categoty_choctreats-01-kitkat.png?itok=GZeMYvGJ'),
      latitude: 43.255409,
      longitude: -79.957804,
    ),
    Report(
      id: 'dwalinawlidn',
      candy: Candy(name: "Snickers", image: 'https://pngimg.com/uploads/snickers/snickers_PNG13929.png'),
      latitude: 43.252158,
      longitude: -79.961219,
    ),
    Report(
      id: '120jkm12i0ndm21i',
      candy: Candy(name: "M&M's", image: 'https://www.pngmart.com/files/12/MM-PNG-HD.png'),
      latitude: 43.253799,
      longitude: -79.963495,
    ),
    Report(
      id: 'padij0a9moind',
      candy: Candy(name: "Kinder Egg", image: 'https://www.kinder.com/ca/sites/kinder_ca/files/2019-11/chocolate-egg-kinder-surprise-20g-fr.png?t=1631039846'),
      latitude: 43.252486,
      longitude: -79.967356,
    ),
    Report(
      id: '3190djoewinofi',
      candy: Candy(name: "M&M's", image: 'https://www.pngmart.com/files/12/MM-PNG-HD.png'),
      latitude: 43.253346,
      longitude: -79.965294,
    )
  ];

  static List<Candy> allCandies = [
    Candy(name: 'KitKat', image: 'https://www.madewithnestle.ca/sites/default/files/styles/global_nav_image/public/nestle_categoty_choctreats-01-kitkat.png?itok=GZeMYvGJ'),
    Candy(name: "Reese's Cups", image: 'https://s7d2.scene7.com/is/image/hersheysassets/0_34000_00440_9_701_44000_136_Item_Front?fmt=png-alpha&hei=3000'),
    Candy(name: "Snickers", image: 'https://pngimg.com/uploads/snickers/snickers_PNG13929.png'),
    Candy(name: "Kinder Egg", image: 'https://www.kinder.com/ca/sites/kinder_ca/files/2019-11/chocolate-egg-kinder-surprise-20g-fr.png?t=1631039846'),
    Candy(name: "M&M's", image: 'https://www.pngmart.com/files/12/MM-PNG-HD.png')
  ];

  static List<Candy> selectedCandies = [];
  
  static List<Report> waypoints = [];

  static List<PointLatLng> pathPoints = [];

  static LocationData locationData;
}

class Candy {
  String name;
  String image;
  // Location location;

  Candy({this.name, this.image});
}

class Report {
  String id;
  Candy candy;
  double latitude;
  double longitude;

  Report({this.id, this.candy, this.latitude, this.longitude});
}