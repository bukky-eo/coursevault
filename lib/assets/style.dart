import 'package:flutter/material.dart';
import 'colors.dart';

class CustomTextStyle extends TextStyle {
  const CustomTextStyle({
    double? spacing,
    double? height,
    double fontSize = 16,
    // FontStyle fontStyle = FontStyle.normal,
    FontWeight fontWeight = FontWeight.w500,
    Color? color = CustomColors.black,
    bool underline = false,
  }) : super(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    // fontStyle: fontStyle,
    height: height,
    letterSpacing: spacing,
    decoration: !underline ? null : TextDecoration.underline,
  );
}
