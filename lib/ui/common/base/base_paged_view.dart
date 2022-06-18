import 'package:movie_curation/ui/common/base/base_paged_view_view_model.dart';
import 'package:movie_curation/utilities/index.dart';

@immutable
abstract class BasePagedView<T extends BasePagedViewViewModel>
    extends GetView<T> {
  const BasePagedView({Key? key}) : super(key: key);

  T get vm => controller;

  @override
  Widget build(BuildContext context) {
    initViewModel();
    observeRxData(context);
    return PageView.builder(
      controller: vm.pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: vm.screenList.length,
      onPageChanged: (index) {
        vm.screenIndex = index;
      },
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return buildPagedView(context);
      },
    );
  }

  @mustCallSuper
  void initViewModel() {
    vm.initialized;
  }

  @mustCallSuper
  void observeRxData(BuildContext context) {}

  Widget buildPagedView(BuildContext context);
}
