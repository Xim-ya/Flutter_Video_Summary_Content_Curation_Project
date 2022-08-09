import 'package:movie_curation/utilities/index.dart';

class SearchPagedView extends HookWidget {
  const SearchPagedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // VM Controller  생성
    Get.lazyPut(() => SearchViewModel(Get.find(), Get.find(), Get.find()));

    //  PagedViewScreen의 Screen Index, 0 : 검색 스크린, 1 : 컨텐츠 상세 스크린
    final _screenIndex = useState(0);

    // PagedView Controller
    final PageController _pagedController =
        PageController(initialPage: _screenIndex.value, keepPage: true);

    // PagedView 안에서 화면이동(route) 하는 메소드
    void _pagedRouteHandler() {
      if (Get.isRegistered<SearchContentDetailViewModel>()) {
        // 직접 Controller을 삭제.
        Get.delete<SearchContentDetailViewModel>();
      } else {
        // `SearchContentDetailViewModel` VM Controller 생성
        Get.lazyPut(() => SearchContentDetailViewModel(
            Get.find(), Get.find(), Get.find(), Get.find()));
      }

      _pagedController.animateToPage(_screenIndex.value == 0 ? 1 : 0,
          duration: const Duration(milliseconds: 480), curve: Curves.easeIn);
    }

    // PagedView에서 관리하는 스크린 리스트 -(화면이동 메소드를 인자로 전달)
    final screenList = [
      SearchScreen(routeAction: _pagedRouteHandler),
      _screenIndex.value == 1
          ? SearchContentDetailScreen(routeAction: _pagedRouteHandler)
          : const SizedBox(),
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
