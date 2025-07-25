import 'package:flutter/material.dart';

class FontSizeUtil {
  static double scaleFont(BuildContext context, double fontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    // You can use a base width (e.g. 375 for iPhone 11)
    return fontSize * (screenWidth / 375);
  }
}