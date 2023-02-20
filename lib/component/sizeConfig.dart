import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = MediaQueryData();
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double heightRatio = 0;
  static double widthRatio = 0;
  static double pix = 0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    pix = MediaQuery.of(context).devicePixelRatio;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    heightRatio = (screenHeight * pix) / (screenWidth * pix);
    widthRatio = (screenWidth * pix) / (screenHeight * pix);
  }
}

int getDeviceTypeContent() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  if (data.size.shortestSide < 600) {
    return 4;
  } else if (data.size.shortestSide < 750) {
    return 5;
  } else if (data.size.shortestSide < 900) {
    return 4;
  } else if (data.size.shortestSide < 1050) {
    return 2;
  } else if (data.size.shortestSide < 1550) {
    return 2;
  } else {
    return 1;
  }
}

int getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  if (data.size.shortestSide < 600) {
    return 1;
  } else if (data.size.shortestSide < 750) {
    return 2;
  } else if (data.size.shortestSide < 900) {
    return 3;
  } else if (data.size.shortestSide < 1050) {
    return 3;
  } else if (data.size.shortestSide < 1550) {
    return 4;
  } else {
    return 10;
  }
}
