import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Hello Eventsly",
    home: Material(
      color:  Colors.white,
      child: Center(
        child: Text(
          "Hello Eventsly",
          textDirection: TextDirection.ltr,
        ),
      ),
    ),
  ));
}

