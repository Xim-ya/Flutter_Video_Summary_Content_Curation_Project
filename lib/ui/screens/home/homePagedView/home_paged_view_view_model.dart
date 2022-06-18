import 'package:movie_curation/ui/common/base/base_paged_view_view_model.dart';
import 'package:movie_curation/utilities/index.dart';

class HomePagedViewViewModel extends BasePagedViewViewModel {
  /* Page View Screen 리스트 */
  @override
  List<Widget> get screenList => [const TempScreen1(), const TempScreen2()];
}
