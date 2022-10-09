import 'package:movie_curation/ui/common/base/base_paged_view_model.dart';
import 'package:movie_curation/utilities/index.dart';

class HomePagedViewModel extends BasePagedViewModel {
  // final RxList<Widget> screenLists = <Widget>[].obs;

  @override
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
    pagedController.animateToPage(selectedScreenIndex.value == 0 ? 1 : 0,
        duration: const Duration(milliseconds: 480), curve: Curves.easeIn);
  }

  @override
  void onInit() {
    // VM Controller  생성
    Get.lazyPut(
        () => HomeViewModel(Get.find(), Get.find(), Get.find(), Get.find()));

    screenList = [
      HomeScreen(routeAction: pagedRouteHandler),
      Obx(
        () => selectedScreenIndex == 1
            ? HomeContentDetailScreen(routeAction: pagedRouteHandler)
            : const SizedBox(),
      )
    ];
  }
}
