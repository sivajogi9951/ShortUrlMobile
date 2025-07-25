import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles{
  static TextStyle get logoStyle  => GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
    fontSize: 20
  );
  TextStyle get navMenu  => GoogleFonts.roboto();
  TextStyle get heading =>
      const TextStyle( fontWeight: FontWeight.bold);
  TextStyle get subHeading =>
      const TextStyle( fontWeight: FontWeight.bold);
  TextStyle get headingBold =>
      const TextStyle( fontWeight: FontWeight.bold);
  TextStyle get subHeadingBold =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  TextStyle get tabTitle =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  TextStyle get title =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  TextStyle get titleBold =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  TextStyle get subTitleBold =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
}