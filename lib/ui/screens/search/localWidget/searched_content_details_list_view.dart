import 'package:movie_curation/utilities/index.dart';

class SearchedContentDetailListView extends BaseView<SearchViewModel> {
  const SearchedContentDetailListView({
    Key? key,
    required this.routeAction,
  }) : super(key: key);

  final VoidCallback routeAction;

  @override
  Widget buildView(BuildContext context) {
    return Obx(() => vm.searchAndSimilarContentList != null
        ? Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: ListView(
              children: [
                // 검색리스트에서 선택된 컨텐츠
                ContentListTileItem(
                    contentItem: vm.searchAndSimilarContentList![0],
                    onItemTapped: () async => vm
                        .searchAndSimilarContentTapped(0)
                        .whenComplete(() => routeAction())),
                const Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Text("연관 컨텐츠",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: AppColor.cloudyGrey,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                vm.searchAndSimilarContentList == null
                    ? const Center(child: CircularProgressIndicator())
                    :
                    // 선택된 컨테츠와 유사한 컨텐츠 리스트
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: vm.searchAndSimilarContentList == null
                            ? 0
                            : vm.searchAndSimilarContentList!.length - 1,
                        itemBuilder: (context, index) {
                          ContentModel? item =
                              vm.searchAndSimilarContentList?[index];

                          return ContentListTileItem(
                              contentItem:
                                  vm.searchAndSimilarContentList![index + 1],
                              onItemTapped: () => vm
                                  .searchAndSimilarContentTapped(index + 1)
                                  .whenComplete(() => routeAction()));
                        }),
              ],
            ),
          )
        : const SizedBox());
  }
}
