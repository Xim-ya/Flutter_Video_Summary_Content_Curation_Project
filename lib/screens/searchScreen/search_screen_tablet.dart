import 'package:movie_curation/screens/searchScreen/localWidget/random_poster_background.dart';
import 'package:movie_curation/utilities/index.dart';

class SearchScreenT extends StatefulWidget {
  @override
  State<SearchScreenT> createState() => _SearchScreenTState();
}

class _SearchScreenTState extends State<SearchScreenT>
    with AutomaticKeepAliveClientMixin {
  final searchVM = SearchVM();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // Gradient Background Container
        const RandomPosterBackground(),
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
                    searchBar(screenWidth),
                    /* Genre Group List */
                    genreGroupButton()
                  ],
                ),
              ),
            ),
            /* Contents List Slider */
            Expanded(
              flex: 2,
              child: contentListSlider(),
            ),
            /* Right Side (Movie Contents) */
          ],
        ),
      ],
    );
  }

  Container contentListSlider() {
    return Container(
      height: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(bottom: 22, top: 22, left: 32),
              height: 200,
              child: Row(
                children: [
                  /* Left Side - Image */
                  AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500https://image.tmdb.org/t/p/w500/5P8SmMzSNYikXpxil6BYzJ16611.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  /* Right Side - Description(title, description, year) */
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 26),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Title
                              Text("더 배트맨",
                                  style: FontStyles().searchedContentTitle),
                              // Release Year
                              Container(
                                  margin: EdgeInsets.only(right: 30),
                                  child: Text(
                                    "2018",
                                    style: FontStyles().searchedContentRYear,
                                  ))
                            ],
                          ),
                          // Description
                          Text(
                            "지난 2년 간 고다심의 어둠 속에서 범법자들을 응징하며 배트맨으로 살아온 브루스 웨인. 알프레드와 제임스 고등 경위의 도움 아래 그는 도시의 부패한 공직자들과 고위 관료들 사이에서 복수의 화신으로 활약한다. 고담의 시장 선거를 앞두고 고담의 엘리티 집단을 목표로 작인한 연쇄 살인을 저리를 조커인가를 조지려고 하는데",
                            style: FontStyles().searchedContentDescription,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Expanded genreGroupButton() {
    return Expanded(
      child: GetBuilder<SearchVM>(
          init: searchVM,
          builder: (context) {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 60, right: 60),
              shrinkWrap: true,
              itemCount: genreOptionList.length,
              itemBuilder: (context, index) {
                final genreItem = genreOptionList[index];
                return TextButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  onPressed: () {
                    searchVM.setSelectedGenre(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 12),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: index == searchVM.selectedGenre
                          ? Border.all(color: kYellow, width: 1)
                          : null,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    margin: EdgeInsets.only(bottom: 4),
                    height: 54,
                    child: Text(
                      genreItem,
                      style: FontStyles().genreOption,
                    ),
                  ),
                );
              },
            );
          }),
    );
  }

  Widget searchBar(double screenWidth) {
    return SizedBox(
      width: screenWidth / 3 * 0.76,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        onSubmitted: (String inputs) {
          print(inputs);
        },
        cursorColor: kYellow,
        style: FontStyles(0, false).searchBarInputs,
        decoration: InputDecoration(
          hintText: "제목을 입력하세요",
          hintStyle: FontStyles(0, false).searchBarPlaceHolder,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kCloudyLightGrey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kCloudyLightGrey),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
