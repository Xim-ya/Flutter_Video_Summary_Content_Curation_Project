import 'package:movie_curation/ui/screens/home/home_view_model_new.dart';
import '../../../utilities/index.dart';

abstract class PresentationModules {
  PresentationModules._();

  static void dependencies() {
    /* Home */
    Get.lazyPut(() => HomeViewModelNew(Get.find(), Get.find()));
  }
}
