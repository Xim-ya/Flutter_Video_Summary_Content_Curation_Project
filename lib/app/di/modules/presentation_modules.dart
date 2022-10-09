import 'package:movie_curation/ui/screens/home/homePagedView/home_paged_view_view_model.dart';
import 'package:movie_curation/ui/screens/home/home_view_model.dart';
import '../../../utilities/index.dart';

abstract class PresentationModules {
  PresentationModules._();

  static void dependencies() {
    Get.lazyPut(() => HomePagedViewModel());
    /* Home */
    // Get.lazyPut(() => HomeViewModel(
    //     Get.find(), Get.find(), Get.find(), Get.find(), Get.find()));
  }
}
