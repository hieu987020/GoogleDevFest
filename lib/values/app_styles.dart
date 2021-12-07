import 'package:flutter/material.dart';

class FontFamily {
  static const montserrat = 'Montserrat';
}

class AppStyles {
  static const TextStyle h1 = TextStyle(
      fontFamily: FontFamily.montserrat, fontSize: 24, color: Colors.white);
  static const TextStyle h2 = TextStyle(
      fontFamily: FontFamily.montserrat, fontSize: 18, color: Colors.white);
  static const TextStyle h3 = TextStyle(
      fontFamily: FontFamily.montserrat, fontSize: 14, color: Colors.white);
}
