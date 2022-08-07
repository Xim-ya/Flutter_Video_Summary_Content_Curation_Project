import 'package:movie_curation/utilities/index.dart';

class SearchScreenScaffold extends BaseView<SearchViewModel> {
  const SearchScreenScaffold(
      {Key? key,
      required this.leadingPart,
      required this.searchBar,
      required this.posterBackground,
      required this.trailingPart})
      : super(key: key);

  final Widget searchBar;
  final Widget posterBackground;
  final Widget leadingPart;
  final Widget trailingPart;

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
                    leadingPart,
                    // Obx(() => isSearchMode.value
                    //     ? searchResultListView
                    //     : verticalGenreGroupBtn)
                  ],
                ),
              ),
            ),
            /* Contents List Slider */
            Expanded(
              flex: 2,
              child: trailingPart,

              // Obx(() => showSearchContent.value
              //     ? verticalContentSlider
              //     : verticalSearchedListSlider),
            ),
            /* Right Side (Movie Contents) */
          ],
        ),
      ],
    );
  }
}
