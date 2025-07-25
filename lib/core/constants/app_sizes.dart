import 'package:flutter/material.dart';

/// Common spacing sizes used throughout the app

class AppSizes {
  // Padding and margin values
  static EdgeInsets edgeAll(val) => EdgeInsets.all(val);
  static EdgeInsets edgeVH({double v = 0, double h = 0}) =>
      EdgeInsets.symmetric(vertical: v, horizontal: h);
  static EdgeInsets edgeOnly({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) => EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
  static SizedBox gap({double? w, double? h}) => SizedBox(width: w, height: h);
}
