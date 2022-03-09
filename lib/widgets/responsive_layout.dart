import 'package:movie_curation/utilities/index.dart';

/* Device 최대 넓이를 확인하여 Tablet, Mobile 반응형 위젯을 인자값으로 전달함 */
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key, required this.mobileWidget, required this.tabletWidget})
      : super(key: key);

  final Widget mobileWidget;
  final Widget tabletWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimension) {
        if (dimension.maxWidth < mobileBreakPoint) {
          return Builder(builder: (context) {
            mobileOrientation; // Portrait(up, down) Orientation 적용
            return mobileWidget;
          });
        } else {
          return Builder(builder: (context) {
            tabletOrientation; // landscape(left, right) Orientation 적용
            return tabletWidget;
          });
        }
      },
    );
  }

  // Break Point
  static const mobileBreakPoint = 780.0;
}
