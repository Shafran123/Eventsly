import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path =Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width-100.0,size.height / 2);
    var firstControlPoint =Offset(size.width /2 ,size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height-300.0);
    var secondControlPoint =Offset(size.width -50.0 ,size.height - 300.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);


    path.lineTo(size.width, size.height-300.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;

  
}