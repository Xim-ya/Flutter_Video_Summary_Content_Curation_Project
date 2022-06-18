import 'package:movie_curation/utilities/index.dart';

/* MovieDetailScreen(M) > MainContentInfoMobile */

class MainContentInfoM extends StatelessWidget {
  final bool isRoutedMain; // 라우트되는 부모 스크린 판별 변수
  final VoidCallback? routeAction;
  final MovieVM movieVM;
  final VoidCallback showDialog;

  const MainContentInfoM(
      {Key? key,
      required this.isRoutedMain,
      this.routeAction,
      required this.movieVM,
      required this.showDialog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final youtubeVM = Get.put(YoutubeVM(model: YoutubeCore()));
    bool isFetched = movieVM.loadingStatus == LoadingStatus.done ? true : false;

    // 네트워크 빈 String 값 예외처리
    String streamString(String passedItem) {
      return passedItem != "" ? passedItem : "내용 없음";
    }

    int? selectedIndex = movieVM.selectedMovieIndex;
    List<dynamic> selectedCategoryContents = movieVM.selectedCategoryContents;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 27.1.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /* Title */
          contentTitle(
              isFetched, streamString, selectedCategoryContents, selectedIndex),
          /* GRated & Release Year */
          otherContentInfo(),
          /* Description */
          contentDescription(width, isFetched, streamString,
              selectedCategoryContents, selectedIndex),
          /* Intent Buttons */
          intentGroupButtons(width, selectedIndex, youtubeVM),
        ],
      ),
    );
  }

  Container intentGroupButtons(
      double width, int? selectedIndex, YoutubeVM youtubeVM) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: isRoutedMain
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          isRoutedMain
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(1, 26),
                    primary: kYellow,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  onPressed: () {
                    final movieTitle = movieVM
                        .selectedCategoryContents[selectedIndex ?? 0].title;
                    final passedIndex = movieVM
                        .selectedCategoryContents[selectedIndex ?? 0].id
                        .toInt();
                    movieVM.fetchGenre(passedIndex);
                    movieVM.fetchActors(passedIndex);
                    youtubeVM.fetchYoutubeSearchQuery(movieTitle);
                    print("AIMED!Q");
                    routeAction!();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/play_ic.svg",
                          height: 14, color: Colors.black),
                      const SizedBox(width: 6),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          "컨텐츠",
                          style: FontStyles(0, true).watchButton,
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
          Wrap(
            children: [
              GradientButton(
                content: "예고편",
                movieVM: movieVM,
                showTrailer: showDialog,
                isUsedInMobile: true,
              ),
              SizedBox(width: 12),
              GradientButton(
                content: "추가",
                movieVM: movieVM,
                showTrailer: () {
                  print("ADD TO FAVORITE");
                },
                isUsedInMobile: true,
              ),
            ],
          )
        ],
      ),
    );
  }

  Container contentDescription(
      double width,
      bool isFetched,
      String streamString(String passedItem),
      List<dynamic> selectedCategoryContents,
      int? selectedIndex) {
    return Container(
      width: width,
      child: Text(
        isFetched
            ? streamString(
                selectedCategoryContents[selectedIndex ?? 0].overview)
            : "",
        maxLines: 3,
        style: FontStyles(0, true).description,
      ),
    );
  }

  Row otherContentInfo() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: kLightGrey,
          ),
          child: Text(
            "C18",
            style: FontStyles(0, true).gRated,
          ),
        ),
        SizedBox(width: 12),
        Text(
          "2018",
          style: FontStyles(0, true).releaseY,
        ),
      ],
    );
  }

  Text contentTitle(bool isFetched, String streamString(String passedItem),
      List<dynamic> selectedCategoryContents, int? selectedIndex) {
    return Text(
      isFetched
          ? streamString(selectedCategoryContents[selectedIndex ?? 0].title)
          : "",
      maxLines: 1,
      style: FontStyles(0, true).movieTitle,
    );
  }
}
