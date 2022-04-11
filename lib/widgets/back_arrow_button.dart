import 'package:movie_curation/utilities/index.dart';

class BackArrowButton extends StatelessWidget {
  final VoidCallback routeAction;
  final bool? isUsedInMobile;
  const BackArrowButton(
      {Key? key, required this.routeAction, this.isUsedInMobile})
      : super(key: key);

  // 디바이스 종류(Mobile, Tablet)에 따라 각각 다른 사이즈를 반환하는 메소드
  double responsiveSize(
      {required double mobileS,
      required double tabletS,
      required bool isMobile}) {
    return isMobile ? mobileS : tabletS;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(
        left: responsiveSize(
            mobileS: 0, tabletS: 30, isMobile: isUsedInMobile ?? false),
        top: responsiveSize(
            mobileS: 0, tabletS: 10.8.sp, isMobile: isUsedInMobile ?? false),
      ),
      iconSize: 13.5.sp,
      icon: SvgPicture.asset("assets/icons/arrow_left_ic.svg"),
      onPressed: () {
        routeAction();
      },
    );
  }
}
