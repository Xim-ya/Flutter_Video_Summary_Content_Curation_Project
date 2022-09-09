import 'package:movie_curation/utilities/index.dart';

/*
 * GetxController 라이프 사이클의 영향을 받지 않는 Service Layer
 * Static 데이터를 전달.
 * */

class ConfigService extends GetxService {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  void openScaffoldDrawer() {
    _globalKey.currentState!.openEndDrawer();
  }

  static ConfigService get to => Get.find();
}
