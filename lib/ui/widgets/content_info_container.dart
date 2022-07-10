import 'package:movie_curation/ui/common/base/base_view.dart';
import 'package:movie_curation/ui/screens/home/home_view_model.dart';
import 'package:movie_curation/utilities/index.dart';

class ContentInfoContainer extends BaseView<HomeViewModel> {
  const ContentInfoContainer({
    Key? key,
    required this.isUsedOnHomeScreen,
    required this.routeAction,
  }) : super(key: key);

  final bool isUsedOnHomeScreen; // 라우트되는 부모 스크린 판별 변수
  final VoidCallback routeAction; // PageView Builder 화면 전환 메소드

  @override
  Widget buildView(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 6,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          width: contentResponsiveW,
          margin: EdgeInsets.only(
            top: 4.25.h,
          ),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* Title */
                Text(
                  vm.selectedMovieContent?.title ?? "",
                  maxLines: 1,
                  style: FontStyles(0, false).movieTitle,
                ),
                otherContentInfo(),
                /* GRated & Release Year */
                SizedBox(
                  width: width * 3 / 5,
                  child: Text(
                    vm.selectedMovieContent?.overview ?? "내용 없음",
                    maxLines: 3,
                    style: FontStyles(0, isUsedInMobile).description,
                  ),
                ),
                const SizedBox(),
                /* Intent Buttons */
                Container(
                  width: width * 3 / 5,
                  child: Row(
                    mainAxisAlignment: isUsedOnHomeScreen
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.start,
                    children: [
                      isUsedOnHomeScreen
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: kYellow,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                              ),
                              onPressed: () {
                                vm.loadMovieCastList();
                                routeAction();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset("assets/icons/play_ic.svg",
                                      height: 20, color: Colors.black),
                                  const SizedBox(width: 6),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                      "컨텐츠",
                                      style: FontStyles(0, isUsedInMobile)
                                          .watchButton,
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
                            onBtnTapHandler: vm.showMovieTrailer,
                            // movieVM: movieVM,
                            // showTrailer: showDialog,
                            // isUsedInMobile: isUsedInMobile,
                          ),
                          const SizedBox(width: 12),
                          GradientButton(
                            content: "추가", onBtnTapHandler: vm.showMovieTrailer,
                            // movieVM: movieVM,
                            // showTrailer: () {
                            //   print("ADD TO FAVORITE");
                            // },
                            // isUsedInMobile: isUsedInMobile,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // intentGroupButtons(width, selectedIndex, youtubeVM),
              ],
            ),
          )),
    );
  }

  final isUsedInMobile = false;

  // 디바이스 종류(Mobile, Tablet)에 따라 각각 다른 사이즈를 반환하는 메소드
  double responsiveSize(
      {required double mobileS,
      required double tabletS,
      required bool isMobile}) {
    return isMobile ? mobileS : tabletS;
  }

  // @override
  // Widget build(BuildContext context) {
  //   // final youtubeVM = Get.put(YoutubeVM(model: YoutubeCore()));
  //   // bool isFetched = movieVM.loadingStatus == LoadingStatus.done ? true : false;
  //
  //   // 네트워크 빈 String 값 예외처리
  //   // String streamString(String passedItem) {
  //   //   return passedItem != "" ? passedItem : "내용 없음";
  //   // }
  //
  //   // int? selectedIndex = movieVM.selectedMovieIndex;
  //   // List<dynamic> selectedCategoryContents = movieVM.selectedCategoryContents;
  //   double width = MediaQuery.of(context).size.width;
  //
  // }

  // Container intentGroupButtons(
  //     double width, int? selectedIndex, YoutubeVM youtubeVM) {
  //   return Container(
  //     width: width * 3 / 5,
  //     child: Row(
  //       mainAxisAlignment: isRoutedMain
  //           ? MainAxisAlignment.spaceBetween
  //           : MainAxisAlignment.start,
  //       children: [
  //         isRoutedMain
  //             ? ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   primary: kYellow,
  //                   padding: const EdgeInsets.symmetric(horizontal: 8),
  //                 ),
  //                 onPressed: () {
  //                   final movieTitle = movieVM
  //                       .selectedCategoryContents[selectedIndex ?? 0].title;
  //                   final passedIndex = movieVM
  //                       .selectedCategoryContents[selectedIndex ?? 0].id
  //                       .toInt();
  //                   movieVM.fetchGenre(passedIndex);
  //                   movieVM.fetchActors(passedIndex);
  //                   youtubeVM.fetchYoutubeSearchQuery(movieTitle);
  //                   routeAction!();
  //                 },
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     SvgPicture.asset("assets/icons/play_ic.svg",
  //                         height: 20, color: Colors.black),
  //                     const SizedBox(width: 6),
  //                     Padding(
  //                       padding: const EdgeInsets.only(top: 2),
  //                       child: Text(
  //                         "컨텐츠",
  //                         style: FontStyles(0, isUsedInMobile).watchButton,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               )
  //             : const SizedBox(),
  //         Wrap(
  //           children: [
  //             GradientButton(
  //               content: "예고편",
  //               movieVM: movieVM,
  //               showTrailer: showDialog,
  //               isUsedInMobile: isUsedInMobile,
  //             ),
  //             SizedBox(width: 12),
  //             GradientButton(
  //               content: "추가",
  //               movieVM: movieVM,
  //               showTrailer: () {
  //                 print("ADD TO FAVORITE");
  //               },
  //               isUsedInMobile: isUsedInMobile,
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  Container contentDescription(
      double width,
      bool isFetched,
      String streamString(String passedItem),
      List<dynamic> selectedCategoryContents,
      int? selectedIndex) {
    return Container(
      width: width * 3 / 5,
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

  // Text contentTitle(bool isFetched, String streamString(String passedItem),
  //     List<dynamic> selectedCategoryContents, int? selectedIndex) {
  //   return Text(
  //     isFetched
  //         ? streamString(selectedCategoryContents[selectedIndex ?? 0].title)
  //         : "",
  //     maxLines: 1,
  //     style: FontStyles(0, isUsedInMobile).movieTitle,
  //   );
  // }
}

class ContentTitle extends StatelessWidget {
  final String title;
  const ContentTitle({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      style: FontStyles(0, false).movieTitle,
    );
  }
}
