import 'package:movie_curation/ui/screens/search/localWidget/content_list_tile_item.dart';
import 'package:movie_curation/utilities/index.dart';

class SearchScreenScaffold extends BaseView<SearchViewModel> {
  const SearchScreenScaffold({
    Key? key,
    required this.isSearchMode,
    required this.searchBar,
    required this.verticalGenreGroupBtn,
    required this.posterBackground,
    required this.verticalContentSlider,
    required this.verticalSearchedListSlider,
  }) : super(key: key);

  final RxBool isSearchMode;
  final Widget searchBar;
  final Widget verticalGenreGroupBtn;
  final Widget posterBackground;
  final Widget verticalContentSlider;
  final Widget verticalSearchedListSlider;

  @override
  Widget buildView(BuildContext context) {
    return Stack(
      children: [
        // Gradient Background Container
        posterBackground,
        // Expanded Row Layout
        Row(
          children: [
            /* Left Side (SearchBar & Genre) */
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 40, left: 20),
                // color: Colors.purple.withOpacity(0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* Search Bar */
                    searchBar,
                    /* Genre Group List */
                    Obx(() => isSearchMode.value
                        ? vm.isSearchLoading.isTrue
                            ? Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: const Center(
                                    child: CircularProgressIndicator()))
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
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      );
                                    }

                                    return TextButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                      onPressed: () =>
                                          vm.onAutoCompleteResultTapped(index),
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        margin:
                                            const EdgeInsets.only(bottom: 4),
                                        height: 54,
                                        child: Obx(() => Text(
                                              vm.contentSearchList![index]
                                                  .title,
                                              style: FontStyles()
                                                  .genreOption
                                                  .copyWith(
                                                      color:
                                                          vm.selectedSearchContentIndex ==
                                                                  index
                                                              ? AppColor.yellow
                                                              : Colors.white),
                                            )),
                                      ),
                                    );
                                  },
                                ),
                              )
                        : verticalGenreGroupBtn)
                  ],
                ),
              ),
            ),
            /* Contents List Slider */
            Expanded(
              flex: 2,
              child: Obx(() => vm.selectedSearchContentIndex == null
                  ? verticalContentSlider
                  : verticalSearchedListSlider),
            ),
            /* Right Side (Movie Contents) */
          ],
        ),
      ],
    );
  }
}
