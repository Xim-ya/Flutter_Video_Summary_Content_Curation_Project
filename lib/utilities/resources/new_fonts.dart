import 'package:flutter/material.dart';
import 'package:movie_curation/utilities/index.dart';

abstract class AppTextStyle {
  AppTextStyle._();

  static TextStyle web1 = PretendardTextStyle.bold(
    size: 40,
    height: 52,
  );

  static TextStyle web2 = PretendardTextStyle.bold(
    size: 36,
    height: 46,
  );

  static TextStyle web3 = PretendardTextStyle.bold(
    size: 32,
    height: 48,
  );

  static TextStyle headline3 = PretendardTextStyle.semiBold(
    size: 18,
    height: 22,
  );

  static TextStyle headline2 = PretendardTextStyle.bold(
    size: 20,
    height: 30,
  );

  static TextStyle headline1 = PretendardTextStyle.bold(
    size: 24,
    height: 37,
  );

  static TextStyle title3 = PretendardTextStyle.semiBold(
    size: 14,
    height: 20,
  );

  static TextStyle title2 = PretendardTextStyle.semiBold(
    size: 16,
    height: 20,
  );

  static TextStyle title1 = PretendardTextStyle.bold(
    size: 16,
    height: 22,
  );

  static TextStyle body3 = PretendardTextStyle.medium(
    size: 13,
    height: 16,
  );

  static TextStyle body2 = PretendardTextStyle.medium(
    size: 14,
    height: 22,
  );

  static TextStyle body1 = PretendardTextStyle.semiBold(
    size: 14,
    height: 22,
  );

  static TextStyle alert1 = PretendardTextStyle.semiBold(
    size: 12,
    height: 18,
  );

  static TextStyle alert2 = PretendardTextStyle.regular(
    size: 12,
    height: 18,
  );
}

@immutable
class PretendardTextStyle extends TextStyle {
  static const pretendardBold = 'pretendard_bold';
  static const pretendardRegular = 'pretendard_regular';
  static const pretendardSemiBold = 'pretendard_semiBold';
  static const pretendardMedium = 'pretendard_medium';

  const PretendardTextStyle(
    String fontFamily,
    Color color,
    double size,
    FontWeight fontWeight,
    double height,
    double? letterSpacing,
  ) : super(
          fontFamily: fontFamily,
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          height: height / size,
          letterSpacing: letterSpacing,
        );

  factory PretendardTextStyle.regular({
    required double size,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      PretendardTextStyle(
          pretendardRegular, color, size, fontWeight, height, letterSpacing);

  factory PretendardTextStyle.semiBold({
    required double size,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      PretendardTextStyle(
          pretendardSemiBold, color, size, fontWeight, height, letterSpacing);

  factory PretendardTextStyle.medium({
    required double size,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      PretendardTextStyle(
          pretendardMedium, color, size, fontWeight, height, letterSpacing);

  factory PretendardTextStyle.bold({
    required double size,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double height = 1.0,
    double? letterSpacing,
  }) =>
      PretendardTextStyle(
          pretendardBold, color, size, fontWeight, height, letterSpacing);
}
