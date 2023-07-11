import 'package:flutter/material.dart';


class CustomIcon extends Image {
  CustomIcon({
    Key? key,
    double? height,
    double? width,
    required String icon,
  })  : assert(height != null || width != null),
        super(
        key: key,
        height: height,
        width: width,
        image: AssetImage(
          'images/$icon.png',
        ),
        fit: BoxFit.contain,
      );
}