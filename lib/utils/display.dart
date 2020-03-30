import 'package:flutter/material.dart';

class DisplayUtil {
  static final double baseHeight = 640.0; //common Android Device
  static double screenAwareSize(double size, BuildContext context) {
    return size * MediaQuery.of(context).size.height / baseHeight;
  }
}