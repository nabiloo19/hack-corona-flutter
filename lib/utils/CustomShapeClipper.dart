import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  
  @override
  getClip(Size size) {
    final Path path = Path(); // the starting point is the 0,0 position of the widget.
    path.lineTo(0.0, size.height);
//    var firstEndPoint = Offset(size.width *.5, size.height - 35);
//    var firstControlPoint = Offset(size.width *.25, size.height - 50);
//    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }
  
  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }
}