import 'package:flutter/material.dart';

class SizeConfig {
  SizeConfig._();

  static final SizeConfig _instance = SizeConfig._();

  factory SizeConfig() => _instance;

  late MediaQueryData _mediaQueryData;
  late double screenWidth;
  late double screenHeight;

  final appBarHeight = AppBar().preferredSize.height;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}
