import 'package:movie_curation/utilities/index.dart';

@immutable
abstract class BasePagedView extends StatelessWidget {
  ValueNotifier<int> screenIndex = 0 as ValueNotifier<int>;
  final List<Widget> screenList = [];
  final PageController pageController = PageController();

  // HomeScreen --> Movie Detail Screen (Route, Based On PageBuilder)
  void routeHandler() {
    pageController.animateToPage(screenIndex == 0 ? 1 : 0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    PageController pageControllerNested = pageController;

    return PageView.builder(
      controller: pageControllerNested,
      // physics: const NeverScrollableScrollPhysics(),
      itemCount: screenList.length,
      onPageChanged: (index) {
        screenIndex = index as ValueNotifier<int>;
      },
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return buildPagedView(context);
      },
    );
  }

  Widget buildPagedView(BuildContext context);
}
