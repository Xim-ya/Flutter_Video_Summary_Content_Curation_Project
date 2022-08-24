import 'package:flutter/widgets.dart';

abstract class AppSpace {
  AppSpace._();

  static const size2 = SizedBox(width: 2, height: 2);
  static const size4 = SizedBox(width: 4, height: 4);
  static const size6 = SizedBox(width: 6, height: 6);
  static const size7 = SizedBox(width: 7, height: 7);
  static const size8 = SizedBox(width: 8, height: 8);
  static const size10 = SizedBox(width: 10, height: 10);
  static const size12 = SizedBox(width: 12, height: 12);
  static const size14 = SizedBox(width: 14, height: 14);
  static const size16 = SizedBox(width: 16, height: 16);
  static const size18 = SizedBox(width: 18, height: 18);
  static const size19 = SizedBox(width: 19, height: 19);
  static const size20 = SizedBox(width: 20, height: 20);
  static const size21 = SizedBox(width: 21, height: 21);
  static const size22 = SizedBox(width: 22, height: 22);
  static const size24 = SizedBox(width: 24, height: 24);
  static const size28 = SizedBox(width: 28, height: 28);
  static const size32 = SizedBox(width: 32, height: 32);
  static const size36 = SizedBox(width: 36, height: 36);
  static const size39 = SizedBox(width: 39, height: 39);
  static const size40 = SizedBox(width: 40, height: 40);
  static const size48 = SizedBox(width: 48, height: 48);
  static const size52 = SizedBox(width: 52, height: 52);
  static const size56 = SizedBox(width: 56, height: 56);
  static const size64 = SizedBox(width: 64, height: 64);
}

extension SizedBoxExtension on SizedBox {
  static SizedBox get space4 => AppSpace.size4;

  static SizedBox get space8 => AppSpace.size8;

  static SizedBox get space12 => AppSpace.size12;

  static SizedBox get space16 => AppSpace.size16;

  static SizedBox get space20 => AppSpace.size20;

  static SizedBox get space24 => AppSpace.size24;

  static SizedBox get space28 => AppSpace.size28;

  static SizedBox get space32 => AppSpace.size32;

  static SizedBox get space36 => AppSpace.size36;

  static SizedBox get space40 => AppSpace.size40;

  static SizedBox get space48 => AppSpace.size48;

  static SizedBox get space52 => AppSpace.size52;

  static SizedBox get space56 => AppSpace.size56;

  static SizedBox get space64 => AppSpace.size64;
}
