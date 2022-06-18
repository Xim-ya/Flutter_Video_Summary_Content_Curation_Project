import 'package:movie_curation/ui/screens/home/homePagedView/home_paged_view_binding.dart';
import 'package:movie_curation/ui/screens/home/new_home_root_page_view.dart';
import '../../utilities/index.dart';
part 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const NewHomePagedView(),
      binding: HomePagedViewBinding(),
    )
  ];
}
