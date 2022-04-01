import 'package:movie_curation/utilities/index.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenIndex = useState(0);
    final PageController _controller =
        PageController(initialPage: 0, keepPage: true);

    // HomeScreen --> Movie Detail Screen 라우트
    void routeHandler() {
      _controller.animateToPage(screenIndex.value == 0 ? 1 : 0,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }

    return ResponsiveLayout(
        mobileWidget: Container(),
        /* Horizon PageView Builder : route 기능으로 이용 */
        tabletWidget: PageView.builder(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          onPageChanged: (index) {
            screenIndex.value = index;
          },
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return [
              HomeScreenT(routeAction: routeHandler),
              MovieDetailScreenT(routeAction: routeHandler),
            ][index];
          },
        ));
  }
}
