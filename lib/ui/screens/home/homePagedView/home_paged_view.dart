import 'package:movie_curation/ui/screens/home/home_screen_new.dart';
import 'package:movie_curation/ui/screens/home/home_view_model_new.dart';
import 'package:movie_curation/ui/screens/temp/temp_screen.dart';
import 'package:movie_curation/utilities/index.dart';

/* 📕 해당 스크린 위젯에서 `Flutter Hook`을 사용하는 이유
  *  Getx를 사용해서 접근해도 무방하겠지만 이렇게 해당 스크린 위젯에서만 필요한 state 관리 로직은
  *  UI와 state로직을 결합시키는 방법을 선호함.
  *
  * 06.19 - PageView 기능을 담고 했는 모듈 클래스를 만드려고 했지만 구현 실패
  * 1. PageController를 분리하면 Widget에서 Controller에 대응을 하지 못함 (- no client issue)
  * 2. [HookWidget]은 추상화 클래스로 상속 받을 수 없음.
  * 3. Hook의 Valunotifier state변수는 사용되는 Context안에서만 선언이 가능.
  * 4. Getx Controller로 접근 해보려고 했지만 위와 같은 문제가 대부분 동일하게 발생.
  *  */

class HomePagedView extends HookWidget {
  const HomePagedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeViewModelNew(Get.find()));

    //  PagedViewScreen의 Screen Index, 0 : 홈 스크린, 1 : 컨텐츠 상세 스크린
    final _screenIndex = useState(0);

    // PagedView Controller
    final PageController _pagedController =
        PageController(initialPage: _screenIndex.value, keepPage: true);

    // PagedView 안에서 화면이동(route) 하는 메소드
    void _pagedRouteHandler() {
      _pagedController.animateToPage(_screenIndex.value == 0 ? 1 : 0,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }

    // PagedView에서 관리하는 스크린 리스트 -(화면이동 메소드를 인자로 전달)
    final screenList = [
      // HomeScreen(routeAction: _pagedRouteHandler),
      const TempHomeScreen(),
      // NewHomeScreen(routeAction: _pagedRouteHandler),
      ContentDetailScreen(routeAction: _pagedRouteHandler),
    ];

    return PageView.builder(
      controller: _pagedController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: screenList.length,
      onPageChanged: (index) {
        _screenIndex.value = index;
      },
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return screenList[index];
      },
    );
  }
}
