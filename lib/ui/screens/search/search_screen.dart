import 'package:movie_curation/utilities/index.dart';

class SearchScreen extends BaseScreen<SearchViewModel> {
  const SearchScreen({Key? key, required this.routeAction}) : super(key: key);
  final VoidCallback routeAction;

  @override
  Widget buildScreen(BuildContext context) {
    return SearchScreenScaffold(
      posterBackground: const RandomPosterBackground(),
      searchBar: _buildSearchBar(),
      leadingPart: _buildLeadingPart(),
      trailingPart: _buildTrailingPart(),
    );
  }

  Widget _buildLeadingPart() {
    return Obx(() => vm.isSearchMode.value
        ? SearchedResultListView(
            isSearchLoading: vm.isSearchLoading,
            contentSearchList: vm.contentSearchList,
            onAutoCompleteResultTapped: vm.onAutoCompleteResultTapped,
            selectedSearchContentIndex: vm.selectedSearchContentIndex)
        : GenreGroupButtonListView(
            onGenreBtnTapped: vm.onGenreBtnTapped,
            selectedGenreKey: vm.selectedGenreKey));
  }

  Widget _buildTrailingPart() {
    return Obx(() => vm.showGenreContentList.isFalse
        ? SearchedContentDetailListView(
            selectedSearchContentIndex: vm.selectedContentIndex,
            selectedSearchContent: vm.selectedContent!,
            routeAction: routeAction)
        : ContentThumbnailVerticalSlider(routeAction: routeAction));
  }

  Widget _buildSearchBar() {
    return SizedBox(
      width: SizeConfig().screenWidth / 3 * 0.76,
      child: TextField(
        onChanged: vm.onSearchInputChanged,
        controller: vm.textEditingController,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        onSubmitted: vm.onSearchInputSubmitted,
        cursorColor: AppColor.yellow,
        style: FontStyles(0, false).searchBarInputs,
        decoration: InputDecoration(
          hintText: "제목을 입력하세요",
          hintStyle: FontStyles(0, false).searchBarPlaceHolder,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.cloudyGrey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.cloudyLightGrey),
          ),
        ),
      ),
    );
  }
}
