import 'package:movie_curation/ui/screens/home/homePagedView/home_paged_view_view_model.dart';

import '../../../../utilities/index.dart';

class HomePagedViewBinding implements Bindings {
  late String channelId;

  @override
  void dependencies() {
    Get.lazyPut<HomePagedViewViewModel>(() => HomePagedViewViewModel());
  }
}
