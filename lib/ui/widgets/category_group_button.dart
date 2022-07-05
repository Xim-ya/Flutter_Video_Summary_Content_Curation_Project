import 'package:movie_curation/ui/common/base/base_view.dart';
import 'package:movie_curation/ui/screens/home/home_view_model_new.dart';
import 'package:movie_curation/utilities/index.dart';

class CategoryGroupButton extends BaseView<HomeViewModelNew> {
  const CategoryGroupButton({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Row(
        children: categoryOptions.map<Widget>((e) {
      int _itemIndex = categoryOptions.indexWhere((content) => content == e);
      return Container(
          // padding: EdgeInsets.only(right: isUsedInMobile ?? false ? 0 : 8),
          padding: const EdgeInsets.only(right: 8),
          child: Obx(
            () => TextButton(
              onPressed: () => vm.onGroupBtnTap(_itemIndex),
              // movieVM.fetchPopularDrama();
              // movieVM.updateCategoryIndex(_itemIndex);
              child: Text(
                e,
                style: TextStyle(
                    color: Colors.white.withOpacity(
                        vm.selectedCategoryIndex.value == _itemIndex
                            ? 1
                            : 0.24),
                    fontSize: groupButtonTextSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ));
    }).toList());
  }
}
