import 'package:eventsly/CustomShapeClipper.dart';
import 'package:flutter/material.dart';
import 'package:eventsly/Screens/SignUp.dart';
import 'package:eventsly/Screens/GoogleSignIn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eventsly/Screens/TestFirebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MaterialApp(
      title: 'Eventsly',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

String data;
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
  bool _success;
  String _userID;
  String _email;
  String _name;
  String _ppic;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
            child: SizedBox(
              width: 200.0,
           child: RaisedButton(
             color: Colors.white,
             child: Row(
               
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Image.asset('images/google.png',width: 20.0,),
                 Text("  "),
                 Text("Login with google",textAlign: TextAlign.center,)
               ],
               
             ),
             
             onPressed: () async
             {
                  _signInWithGoogle();
               Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                        HomeTest(),
                      
                        ));
             },
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
           ),
            )
          ),
        Container(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
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
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInPage();
                        }));
                      },
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
                padding: const EdgeInsets.only(left: 175.0, top: 80.0),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
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
              padding: const EdgeInsets.only(top: 160.0, left: 135.0),
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

  // Example code of how to sign in with google.
  void _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        _success = true;
        _userID = user.uid;
        _email = user.email;
        _name = user.displayName;
        _ppic = user.photoUrl;
        return _userID;
      } else {
        _success = false;
      }
    });
  }
}
