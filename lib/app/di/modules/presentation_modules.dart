import 'package:movie_curation/ui/screens/home/home_view_model.dart';
import '../../../utilities/index.dart';

abstract class PresentationModules {
  PresentationModules._();

  static void dependencies() {
    /* Home */
    Get.lazyPut(() => HomeViewModel(Get.find(), Get.find()));
  }
}
