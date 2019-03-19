import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Eventsly',
      debugShowCheckedModeBanner: false,
      home: LoginNumber(),
    ));



class LoginNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text("Hello")
        ],
      ),
    );
  }
}
