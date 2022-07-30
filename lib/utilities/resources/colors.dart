import '../index.dart';

abstract class AppColor {
  AppColor._();

  static LinearGradient linearPosterBackground = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      darkGrey,
      darkGrey.withOpacity(0.95),
      darkGrey.withOpacity(0.9),
      darkGrey.withOpacity(0.7),
      darkGrey.withOpacity(0.5),
      darkGrey.withOpacity(0.4),
    ],
    tileMode: TileMode.clamp,
  );

  static LinearGradient linearYoutubeThumbnailBackground = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: <Color>[
      Colors.black.withOpacity(0.7),
      AppColor.darkGrey.withOpacity(0.3),
      AppColor.darkGrey.withOpacity(0.15),
      AppColor.darkGrey.withOpacity(0.1),
    ],
    tileMode: TileMode.clamp,
  );

  static LinearGradient linearSearchBackground = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      darkGrey,
      darkGrey.withOpacity(0.95),
      darkGrey.withOpacity(0.9),
      darkGrey.withOpacity(0.7),
      darkGrey.withOpacity(0.5),
      darkGrey.withOpacity(0.4),
    ],
    tileMode: TileMode.clamp,
  );

  static const Color yellow = Color(0xFFFFE24B);
  static const Color darkGrey = Color(0xFF1D1D1D);
  static const Color lightGrey = Color(0xFF646464);
  static const Color cloudyGrey = Color(0xFFB9B9B9);
  static const Color cloudyLightGrey = Color(0xFF505050);
  static const Color white = Color(0xFFFFFFFF);
}
