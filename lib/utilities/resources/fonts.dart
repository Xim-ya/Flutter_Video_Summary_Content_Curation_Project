import 'package:movie_curation/utilities/index.dart';

abstract class AppTextStyle {
  AppTextStyle._();

  /* Responsive Text Size -  */
  // catgoryGorupButton
  static TextStyle r32B = TextStyle(
    fontSize: 9.55.sp,
    fontWeight: FontWeight.bold,
  );

  // movieTitle
  static TextStyle r32R = TextStyle(
    fontSize: 15.6.sp,
    fontWeight: FontWeight.w400,
  );

  //gRated
  static TextStyle r16N = TextStyle(
    fontSize: 4.69.sp,
    fontWeight: FontWeight.normal,
  );

  //releaseY
  static TextStyle r19N = TextStyle(
    fontSize: 5.69.sp,
    fontWeight: FontWeight.normal,
  );

  //description
  static TextStyle r20N = TextStyle(
    fontSize: 5.8.sp,
    fontWeight: FontWeight.normal,
    // overflow: TextOverflow.ellipsis,
  );

  // watchButton & // else Button
  static TextStyle r22B = TextStyle(
    fontSize: 6.5.sp,
    fontWeight: FontWeight.bold,
  );
}
