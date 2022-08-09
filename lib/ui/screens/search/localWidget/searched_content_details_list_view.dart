import 'package:movie_curation/utilities/index.dart';

class SearchedContentDetailListView extends BaseView<SearchViewModel> {
  const SearchedContentDetailListView({
    Key? key,
    required this.routeAction,
    required this.selectedSearchContentIndex,
    required this.similarContentList,
  }) : super(key: key);

  final int? selectedSearchContentIndex;
  final List<ContentModel>? similarContentList;
  final VoidCallback routeAction;

  @override
  Widget buildView(BuildContext context) {
    return vm.searchAnndSimilarContentList != null
        ? Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: ListView(
              children: [
                // 검색리스트에서 선택된 컨텐츠
                ContentListTileItem(
                    contentItem: vm.searchAnndSimilarContentList![0],
                    onItemTapped: routeAction),
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
                vm.searchAnndSimilarContentList == null
                    ? const Center(child: CircularProgressIndicator())
                    :
                    // 선택된 컨테츠와 유사한 컨텐츠 리스트
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: similarContentList!.length,
                        itemBuilder: (context, index) {
                          return ContentListTileItem(
                              contentItem: similarContentList![index],
                              onItemTapped: () => vm
                                  .searchAndSimilarContentTapped(index)
                                  .whenComplete(() => routeAction()));
                        }),
              ],
            ),
          )
        : const SizedBox();
  }
}

// import 'package:movie_curation/utilities/index.dart';
//
// class SearchedContentDetailListView extends BaseView<SearchViewModel> {
//   const SearchedContentDetailListView({
//     Key? key,
//     required this.selectedSearchContent,
//     required this.routeAction,
//     required this.selectedSearchContentIndex,
//     required this.similarContentList,
//   }) : super(key: key);
//
//   final int? selectedSearchContentIndex;
//   final ContentModel? selectedSearchContent;
//   final List<ContentModel>? similarContentList;
//   final VoidCallback routeAction;
//
//   @override
//   Widget buildView(BuildContext context) {
//     return vm.selectedContent != null
//         ? Padding(
//       padding: const EdgeInsets.only(top: 40, left: 20),
//       child: ListView(
//         children: [
//           // 검색리스트에서 선택된 컨텐츠
//           ContentListTileItem(
//               contentItem: selectedSearchContent!,
//               onItemTapped: routeAction),
//           const Padding(
//             padding: EdgeInsets.only(right: 40),
//             child: Text("연관 컨텐츠",
//                 textAlign: TextAlign.end,
//                 style: TextStyle(
//                   color: AppColor.cloudyGrey,
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                 )),
//           ),
//           similarContentList == null
//               ? const Center(child: CircularProgressIndicator())
//               :
//           // 선택된 컨테츠와 유사한 컨텐츠 리스트
//           ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: similarContentList!.length,
//               itemBuilder: (context, index) {
//                 return ContentListTileItem(
//                     contentItem: similarContentList![index],
//                     onItemTapped: () {});
//               }),
//         ],
//       ),
//     )
//         : const SizedBox();
//   }
// }
