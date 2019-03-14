import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// the root widget of our application
class MyApp extends StatelessWidget {
  String get data => null;

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body:  Container(
            alignment: Alignment.bottomLeft,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage('images/Path1.png'),
                  alignment: Alignment.topLeft
                  // fit: BoxFit.cover,
                  ),
            ),
            child: new Text('Eventsly',
                style: new TextStyle(
                    fontSize: 70.0,
                    fontFamily: 'Cocogoose Pro',
                    color: Colors.white)
                    ),
                 
                    padding: EdgeInsets.only(bottom: 675.0),  
                    
            ),
          )
        );
  }
}
