import 'package:movie_curation/utilities/index.dart';

class SearchedResultListView extends BaseView<SearchViewModel> {
  const SearchedResultListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Obx(() => vm.isSearchLoading.isTrue
        ? Container(
            margin: const EdgeInsets.only(top: 20),
            child: const Center(child: CircularProgressIndicator()))
        : Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: vm.contentSearchList?.length ?? 1,
              itemBuilder: (context, index) {
                if (vm.contentSearchList == null) {
                  const Center(
                    child: Center(
                      child: Text(
                        "검색된 컨텐츠가 없습니다",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }

                return TextButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  onPressed: () async {
                    vm.onAutoCompleteResultTapped(index);
                  },
                  child: Container(
                      padding: const EdgeInsets.only(left: 12),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      margin: const EdgeInsets.only(bottom: 4),
                      height: 54,
                      child: Text(
                        vm.contentSearchList![index].title,
                        style: FontStyles().genreOption.copyWith(
                            color: vm.selectedSearchContentIndex == index
                                ? AppColor.yellow
                                : Colors.white),
                      )),
                );
              },
            ),
          ));
  }
}
