import 'package:movie_curation/utilities/index.dart';

class SearchScreen extends BaseScreen<SearchViewModel> {
  const SearchScreen({Key? key, required this.routeAction}) : super(key: key);
  final VoidCallback routeAction;

  @override
  Widget buildScreen(BuildContext context) {
    return SearchScreenScaffold(
      posterBackground: const RandomPosterBackground(),
      searchBar: _buildSearchBar(),
      verticalGenreGroupBtn: _buildVerticalGenreGroupBtn(),
      verticalContentSlider:
          ContentThumbnailVerticalSlider(routeAction: routeAction),
    );
  }

  Widget _buildVerticalGenreGroupBtn() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 60, right: 60),
        shrinkWrap: true,
        itemCount: genreKeyList.length,
        itemBuilder: (context, index) {
          final genreKey = genreKeyList[index];
          final genreItem = genreDefaults[genreKey];
          return Obx(
            () => TextButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              onPressed: () => vm.onGenreBtnTapped(genreKey),
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: genreKey == vm.selectedGenreKey
                      ? Border.all(color: kYellow, width: 1)
                      : null,
                  borderRadius: BorderRadius.circular(6),
                ),
                margin: const EdgeInsets.only(bottom: 4),
                height: 54,
                child: Text(
                  genreItem ?? "장르",
                  style: FontStyles().genreOption,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return SizedBox(
      width: SizeConfig().screenWidth / 3 * 0.76,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        onSubmitted: (String inputs) {
          print(inputs);
        },
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
