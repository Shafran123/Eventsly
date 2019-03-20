import 'package:flutter/material.dart';
import 'package:eventsly/Screens/Home.dart';
import 'package:eventsly/ShapeClipper.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

void main() => runApp(MaterialApp(
      title: 'Eventsly',
      debugShowCheckedModeBanner: false,
      home: SignUpVerify(),
    ));

Color firstColor = Color(0xFF185BB5);
Color secondColor = Color(0xFF092A56);

class SignUpVerify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        VerifyScreenTop(),
        VerifyScreenBottom(),
      ],
    ));
  }
}

class VerifyScreenTop extends StatefulWidget {
  @override
  _VerifyScreenTopState createState() => _VerifyScreenTopState();
}

class _VerifyScreenTopState extends State<VerifyScreenTop> {
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

class VerifyScreenBottom extends StatefulWidget {
  @override
  _VerifyScreenBottomState createState() => _VerifyScreenBottomState();
}

class _VerifyScreenBottomState extends State<VerifyScreenBottom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 150.0),
            child: PinEntryTextField(
              showFieldAsBox: true,
              onSubmit: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 230.0),
          child: Center(
            child: Container(
            child: Text(
            "Not Revicive Verfication Code! Click Here!",
            style: TextStyle(
              fontSize: 10.0
            ),
          ))),
        ),Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Image.asset('images/img1.png',width: 100,)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 110.0),
          child: Center(
            child: Container(
              child: Text(
                "Enter Verification Code!",
                style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 20.0,
                    color: Colors.blueAccent),
              ),
            ),
          ),
        ), 
        Padding(
          padding: const EdgeInsets.only(top: 250.0),
          child: Center(
          
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              child: Text(
                "Verify!",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                return Home();
                              }));
              },
            ),
          ),
        )
      ],
    );
  }
}
