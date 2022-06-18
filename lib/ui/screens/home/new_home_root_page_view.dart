import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_curation/ui/common/base/base_paged_view.dart';
import 'package:movie_curation/ui/screens/home/homePagedView/home_paged_view_view_model.dart';

import 'package:movie_curation/utilities/index.dart';

class NewHomePagedView extends BasePagedView<HomePagedViewViewModel> {
  const NewHomePagedView({Key? key}) : super(key: key);

  @override
  Widget buildPagedView(BuildContext context) {
    return vm.screenList[vm.screenIndex];
  }
}
