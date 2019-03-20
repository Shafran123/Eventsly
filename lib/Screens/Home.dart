import 'package:flutter/material.dart';
import 'package:eventsly/ShapeClipper.dart';
void main() => runApp(MaterialApp(
      title: 'Eventsly',
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

Color firstColor = Color(0xFF185BB5);
Color secondColor = Color(0xFF092A56);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
         currentIndex: 0,
         items:[
           BottomNavigationBarItem(
             icon: Icon(Icons.calendar_today),
             title: Text("Up Coming")
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.mail),
             title: Text("Invited")
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.collections_bookmark),
             title: Text("Went")
           )
         ],
       ),
        body: Column(
      children: <Widget>[
        HomeScreenTop(),
       
        ],
    ));
  }
}

class HomeScreenTop extends StatefulWidget {
  @override
 _HomeScreenTop createState()  => _HomeScreenTop();
  
}

class _HomeScreenTop extends State<HomeScreenTop> {
  @override
  Widget build(BuildContext context) {
  return Stack(
      children: <Widget>[
        ClipPath(
          clipper: ShapeClipper(),
          child: Container(
            height: 200.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [firstColor, secondColor],
            )),
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
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          debugPrint('Hi');
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text( "Event Management System",style: TextStyle(
                        fontFamily: 'Gotham',
                                  color: Colors.white,
                                  fontSize: 17.0),
                              textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

  }
}