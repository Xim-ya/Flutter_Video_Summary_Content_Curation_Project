import 'package:movie_curation/utilities/index.dart';

class BackArrowButton extends StatelessWidget {
  final VoidCallback routeAction;
  const BackArrowButton({Key? key, required this.routeAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      top: 10.8.sp,
      child: IconButton(
        iconSize: 13.5.sp,
        icon: SvgPicture.asset("assets/icons/arrow_left_ic.svg"),
        onPressed: () {
          routeAction();
        },
      ),
    );
  }
}
