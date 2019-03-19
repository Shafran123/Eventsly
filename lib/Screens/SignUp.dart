import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Eventsly',
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    ));

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[SignUpScreen()],
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AppBar(
          title: Text("Sign Up Eventsly"),
        ),
        Center(
          child: SizedBox(
              width: 350.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                            Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/img1.png',
                              width: 200.0,
                          ),
                        ),
                        const ListTile(
                          
                          title: Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Gotham",
                              fontSize: 30.0,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ),
                    
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 0.2,
                                fontSize: 15.0,
                                color: Colors.blueAccent),
                            decoration: InputDecoration(
                                labelText: "Name",
                                labelStyle: TextStyle(
                                    fontSize: 15.0, fontFamily: 'Gotham'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 0.2,
                                fontSize: 15.0,
                                color: Colors.blueAccent),
                            decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    fontSize: 15.0, fontFamily: 'Gotham'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 0.2,
                                fontSize: 15.0,
                                color: Colors.blueAccent),
                            decoration: InputDecoration(
                                labelText: "Contact No",
                                labelStyle: TextStyle(
                                    fontSize: 15.0, fontFamily: 'Gotham'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 0.2,
                                fontSize: 15.0,
                                color: Colors.blueAccent),
                            decoration: InputDecoration(
                                labelText: "Address",
                                labelStyle: TextStyle(
                                    fontSize: 15.0, fontFamily: 'Gotham'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22.0))),
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          child: RaisedButton(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.blue,
                            elevation: 4.0,
                            splashColor: Colors.blueGrey,
                            onPressed: () {
                              // Perform some action
                            },
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        )
                      ],
                    ),
                  ),
                ),
              )),
        )
      ],
    );
  }
}
