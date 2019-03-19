import 'package:eventsly/CustomShapeClipper.dart';
import 'package:flutter/material.dart';
import 'package:eventsly/Screens/SignUp.dart';

void main() => runApp(MaterialApp(
      title: 'Eventsly',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));

Color firstColor = Color(0xFF185BB5);
Color secondColor = Color(0xFF092A56);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeScreenTopPart(),
          homeScreenBottomPart,
          HBT(),
        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [firstColor, secondColor],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Eventsly",
                        style: TextStyle(
                            fontFamily: 'Cocogoose Pro',
                            color: Colors.white,
                            fontSize: 60.0),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Event Management System",
                        style: TextStyle(
                            fontFamily: 'Gotham',
                            color: Colors.white,
                            fontSize: 17.0),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

var homeScreenBottomPart = Column(
  children: <Widget>[
    Center(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 90.0),
            child: Center(
                child: Image.asset(
              'images/img1.png',
              width: 200.0,
            )),
          ),
        ],
      ),
    ),
    Center(
      child: Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 100.0, top: 10.0),
              child: Text("Easy Fast Platform",
                  style: TextStyle(
                      fontFamily: 'Gotham',
                      fontSize: 20.0,
                      color: Colors.blueAccent)),
            ),
          ],
        ),
      ),
    ),
  
  ],
);

class HBT extends StatefulWidget {
  @override
  _HBTState createState() => _HBTState();
}

class _HBTState extends State<HBT> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: 200.0,
                  child: RaisedButton(
                      child: const Text(
                        'Login!',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      elevation: 4.0,
                      splashColor: Colors.blueGrey,
                      onPressed: () {},
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)))),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 175.0 , top: 80.0),
                child: SizedBox(
                  width: 200.0,
                  child: RaisedButton(
                      child: const Text(
                      'Sign Up!',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    onPressed: () {
                      // Perform some action
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return SignUp();
                      }));
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0))),

                  ),
                ),
              )
            ],
          ),
        ),
        
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 160.0 , left: 135.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "All Rights Reserved! Eventsly 2019",
                    style: TextStyle(fontFamily: 'Gotham', fontSize: 6.0),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
