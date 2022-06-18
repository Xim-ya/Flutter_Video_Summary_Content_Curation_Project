import 'package:movie_curation/app/di/modules/domain_modules.dart';
import 'package:movie_curation/ui/screens/home/homePagedView/home_paged_view_view_model.dart';
import '../../utilities/index.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    DomainModules.dependencies();
    Get.lazyPut(() => HomePagedViewViewModel());
  }
}
