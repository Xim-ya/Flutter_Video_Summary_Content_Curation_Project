import 'package:movie_curation/utilities/index.dart';

class HomePagedViewModel extends BaseViewModel {
  /* State Variables */
  //  PagedViewScreen의 Screen Index, 0 : 홈 스크린, 1 : 컨텐츠 상세 스크린
  final RxInt _screenIndex = 0.obs;

  /* Controllers */
  // PagedView Controller
  late PageController pagedController;

  // PagedView 안에서 화면이동(route) 하는 메소드
  void pagedRouteHandler() {
    if (Get.isRegistered<HomeContentDetailViewModel>()) {
      // 직접 Controller을 삭제.
      Get.delete<HomeContentDetailViewModel>();
    } else {
      // `ContentDetail` VM Controller 생성
      Get.lazyPut(
          () => HomeContentDetailViewModel(Get.find(), Get.find(), Get.find()),
          fenix: true);
    }
    // PagedView 라우팅
    pagedController.animateToPage(_screenIndex.value == 0 ? 1 : 0,
        duration: const Duration(milliseconds: 480), curve: Curves.easeIn);
  }

  /* Intent */
  void onPageChanged(int index) {
    _screenIndex(index);
    update();
  }

  @override
  void onInit() {
    pagedController =
        PageController(initialPage: _screenIndex.value, keepPage: true);

    // VM Controller  생성
    Get.lazyPut(
        () => HomeViewModel(Get.find(), Get.find(), Get.find(), Get.find()));
  }

  int get screenIndex => _screenIndex.value;
}
