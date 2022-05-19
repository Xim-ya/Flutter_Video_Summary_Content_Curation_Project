import 'package:movie_curation/utilities/index.dart';

class HomePageBuilderT extends HookWidget {
  const HomePageBuilderT({Key? key}) : super(key: key);

  /* 📕 해당 스크린 위젯에서 `Flutter Hook`을 사용하는 이유
  *  Getx를 사용해서 접근해도 무방하겠지만 이렇게 해당 스크린 위젯에서만 필요한 state 관리 로직은
  *  UI와 state로직을 결합시키는 방법을 선호함.
  *  */

  @override
  Widget build(BuildContext context) {
    final screenIndex =
        useState(0); // PageBuilder Screen Index, 0 : 홈 스크린, 1 : 컨텐츠 상세 스크린
    final PageController _controller =
        PageController(initialPage: screenIndex.value, keepPage: true);

    // HomeScreen --> Movie Detail Screen (Route, Based On PageBuilder)
    void routeHandler() {
      _controller.animateToPage(screenIndex.value == 0 ? 1 : 0,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }

    return PageView.builder(
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
    );
  }
}
