import 'package:flutter/material.dart';

class Trip extends StatefulWidget {
  const Trip({ Key key }) : super(key: key);

  @override
  _TripState createState() => _TripState();
}

class _TripState extends State<Trip> {
  double _buttonOpacity = 1.0;

  double _timeInMins = 60;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Plan a Route", style: Theme.of(context).textTheme.headline1),
              Container(height: 25),
              Text("Favorite Treats", style: Theme.of(context).textTheme.subtitle1),
              Text("Trip Length", style: Theme.of(context).textTheme.subtitle1),
              Row(
                children: [
                  Expanded(child: Slider.adaptive(value: _timeInMins, onChanged: (value) => setState(() => _timeInMins = value), min: 0, max: 270, activeColor: Colors.white)),
                  Container(
                    width: 100,
                    child: Text("${_timeInMins.toInt()} mins", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.end,)
                  ),
                ],
              ),
              Expanded(child: Container()),
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

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Trip()));
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
          ),
        ),
      )
    );
  }
}