import 'package:flutter/material.dart';

class AppBarClipper extends CustomClipper<Path> {
  final num curveHeight;

  AppBarClipper({this.curveHeight = 25});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - curveHeight);
    path.quadraticBezierTo(size.width / 2, size.height + curveHeight / 2,
        size.width, size.height - curveHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
