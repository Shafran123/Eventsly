import 'package:flutter/material.dart'; 

class ShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path1 = Path();
    path1.lineTo(0.0, size.height);
    path1.lineTo(size.width, size.height);
    path1.lineTo(size.width, 0.0);
    path1.close();
    return path1;
  }



  @override
  bool shouldReclip(CustomClipper oldClipper) => true;

}