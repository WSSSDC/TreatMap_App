import 'package:flutter/material.dart';
import 'package:hackolantern/data.dart';
import 'package:hackolantern/findroute.dart';

class Trip extends StatefulWidget {
  const Trip({ Key key }) : super(key: key);

  @override
  _TripState createState() => _TripState();
}

class _TripState extends State<Trip> {
  double _buttonOpacity = 1.0;

  // double _timeInMins = 60;
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
              Expanded(
                child: ListView(
                  // scrollDirection: Axis.horizontal,
                  children: Data.allCandies.map((e) => 
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: width,
                        child: Row(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: 100,
                                maxWidth: 180,
                              ),
                              padding: EdgeInsets.all(10),
                              child: Expanded(child: Image.network(
                                e.image != 'temp' ? e.image : 'https://www.madewithnestle.ca/sites/default/files/styles/global_nav_image/public/nestle_categoty_choctreats-01-kitkat.png',
                              ),
                                
                              )
                            ),
                            Expanded(child: Container()),
                            Column(
                              children: [
                                Text(e.name, style: Theme.of(context).textTheme.bodyText1),
                                Data.selectedCandies.contains(e) ? 
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          Data.selectedCandies.remove(e);
                                        });
                                      },
                                    ),
                                    Container(
                                      width: 18,
                                      alignment: Alignment.center,
                                      child: Text(Data.selectedCandies.where((element) => element.name == e.name).length.toString())
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          Data.selectedCandies.add(e);
                                        });
                                      },
                                    ),
                                  ],
                                )
                                : 
                                MaterialButton(onPressed: (){
                                  setState(() {
                                    Data.selectedCandies.add(e);                                  
                                  });
                                }, child: Text("Add to basket"), color: Colors.purple)
                              ],
                            ),
                            Container(width: 15),
                          ],
                        ),
                      ),
                    ),
                  ).toList()
                ),
              ),
              // Text("Trip Length", style: Theme.of(context).textTheme.subtitle1),
              // Row(
              //   children: [
              //     Expanded(child: Slider.adaptive(value: _timeInMins, onChanged: (value) => setState(() => _timeInMins = value), min: 0, max: 270, activeColor: Colors.white)),
              //     Container(
              //       width: 100,
              //       child: Text("${_timeInMins.toInt()} mins", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.end,)
              //     ),
              //   ],
              // ),
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

                    Navigator.push(context, MaterialPageRoute(builder: (context) => FindRoute()));
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