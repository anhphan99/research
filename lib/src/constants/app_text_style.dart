import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle customStyle(
      double size, Color color, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: 'Inter',
      color: color,
      fontWeight: fontWeight,
      fontStyle: FontStyle.normal,
      fontSize: size,
    );
  }
}
