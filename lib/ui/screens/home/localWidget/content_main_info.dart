import 'package:movie_curation/utilities/index.dart';

class ContentMainInfo extends StatelessWidget {
  final bool isRoutedMain; // 라우트되는 부모 스크린 판별 변수
  final VoidCallback? routeAction;
  final MovieVM movieVM;
  final VoidCallback showDialog;
  final bool? isUsedInMobile;

  const ContentMainInfo(
      {Key? key,
      required this.isRoutedMain,
      this.routeAction,
      required this.movieVM,
      required this.showDialog,
      this.isUsedInMobile})
      : super(key: key);

  // 디바이스 종류(Mobile, Tablet)에 따라 각각 다른 사이즈를 반환하는 메소드
  double responsiveSize(
      {required double mobileS,
      required double tabletS,
      required bool isMobile}) {
    return isMobile ? mobileS : tabletS;
  }

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
    return Expanded(
      flex: isUsedInMobile ?? false ? 5 : 6,
      // flex: 6,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: isUsedInMobile ?? false ? 16 : 0),
        width: responsiveSize(
            mobileS: double.infinity,
            tabletS: contentResponsiveW,
            isMobile: isUsedInMobile ?? false),
        margin: EdgeInsets.only(
            top: responsiveSize(
                mobileS: 1.8.h,
                tabletS: 4.25.h,
                isMobile: isUsedInMobile ?? false)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Title */
            contentTitle(isFetched, streamString, selectedCategoryContents,
                selectedIndex),
            /* GRated & Release Year */
            otherContentInfo(),
            /* Description */
            contentDescription(width, isFetched, streamString,
                selectedCategoryContents, selectedIndex),
            const SizedBox(),
            /* Intent Buttons */
            intentGroupButtons(width, selectedIndex, youtubeVM),
          ],
        ),
      ),
    );
  }

  Container intentGroupButtons(
      double width, int? selectedIndex, YoutubeVM youtubeVM) {
    return Container(
      width: isUsedInMobile ?? false ? width : width * 3 / 5,
      child: Row(
        mainAxisAlignment: isRoutedMain
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          isRoutedMain
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        isUsedInMobile ?? false ? const Size(1, 26) : null,
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
                    routeAction!();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/play_ic.svg",
                          height: isUsedInMobile ?? false ? 14 : 20,
                          color: Colors.black),
                      const SizedBox(width: 6),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          "컨텐츠",
                          style: FontStyles(0, isUsedInMobile).watchButton,
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
                isUsedInMobile: isUsedInMobile,
              ),
              SizedBox(width: 12),
              GradientButton(
                content: "추가",
                movieVM: movieVM,
                showTrailer: () {
                  print("ADD TO FAVORITE");
                },
                isUsedInMobile: isUsedInMobile,
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
      width: isUsedInMobile ?? false ? width : width * 3 / 5,
      child: Text(
        isFetched
            ? streamString(
                selectedCategoryContents[selectedIndex ?? 0].overview)
            : "",
        maxLines: 3,
        style: FontStyles(0, isUsedInMobile).description,
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
            style: FontStyles(0, isUsedInMobile).gRated,
          ),
        ),
        SizedBox(width: 12),
        Text(
          "2018",
          style: FontStyles(0, isUsedInMobile).releaseY,
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
      style: FontStyles(0, isUsedInMobile).movieTitle,
    );
  }
}
