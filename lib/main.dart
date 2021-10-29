import 'package:flutter/material.dart';
import 'package:hackolantern/trip.dart';
import 'package:google_fonts/google_fonts.dart';
import 'map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold, color: Colors.white),
          subtitle1: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.grey),
          bodyText1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _buttonOpacity = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          AppleMapsExample(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.black,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    width: width,
                    height: 136,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 8),
                        Text(
                          "30 Reports Nearby",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        Container(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTapDown: (_) {
                              setState(() {
                                _buttonOpacity = 0.5;
                              });
                            },

                            onTapUp: (_) {
                              setState(() {
                                _buttonOpacity = 1;
                              });

                              Navigator.push(context, MaterialPageRoute(builder: (context) => Trip()));
                            },
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 30),
                              opacity: _buttonOpacity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                color: Colors.deepOrange,
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  width: width,
                                  child: Center(
                                    child: Text(
                                      "FIND ROUTE",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )
                                    ),
                                  ),
                                )
                              ),
                            ),
                          ),
                        ),
                      ]
                    )
                  ),
                ),
            ),
          )
        ],
      ),
    );
  }
}