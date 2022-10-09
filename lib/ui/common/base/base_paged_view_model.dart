import 'package:movie_curation/utilities/index.dart';

abstract class BasePagedViewModel extends GetxController {
  //  PagedViewScreen의 Screen Index, 0 : 메인 스크린, 1 : 컨텐츠 상세 스크린

  late List<Widget> screenList;

  final selectedScreenIndex = 0.obs;

  // PagedView Controller
  late PageController pagedController =
      PageController(initialPage: selectedScreenIndex.value, keepPage: true);

  /* Intent */
  void onPageChanged(int index) {
    selectedScreenIndex(index);
    update();
  }

  void pagedRouteHandler();
}
