import 'package:movie_curation/utilities/index.dart';

class ContentDetailNewScreen extends BaseScreen<HomeViewModel> {
  const ContentDetailNewScreen({Key? key, required this.routeAction})
      : super(key: key);
  final VoidCallback routeAction; //;

  @override
  Widget buildScreen(BuildContext context) {
    final youtubeVM = Get.put(YoutubeVM(model: YoutubeCore()));
    final movieVM = Get.put(MovieVM(model: MovieCore()));
    bool isFetched = movieVM.loadingStatus == LoadingStatus.done ? true : false;
    int? selectedIndex = movieVM.selectedMovieIndex;

    return Builder(
      builder: (context) {
        return Stack(
          children: [
            // GradientPostBackground(isRoutedMain: false, movieVM: movieVM),
            GradientPostBackground(
                backgroundImgUrl: vm.selectedMovieContent?.posterUrl ??
                    vm.selectedMovieContent?.backDropUrl),
            BackArrowButton(routeAction: routeAction),
            Row(
              children: [
                /* Left Section */
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: contentTopP, left: kWS54, bottom: contentBottomP),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /* Content Main Info  */
                        ContentInfoContainer(
                            isUsedOnHomeScreen: false,
                            routeAction: routeAction),
                        Expanded(
                          flex: 10,
                          child: Container(
                            padding: EdgeInsets.only(top: kCastDiverP),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /* Actor(Cast) Slider */
                                Obx(() => vm.contentCastList == null
                                    ? const SizedBox()
                                    : CastSlider(
                                        movieVM: movieVM,
                                        castList: vm.contentCastList!)),

                                /* Else (Rate & Genre) */
                                MovieElseInfo(
                                    isFetched: isFetched,
                                    movieVM: movieVM,
                                    selectedIndex: selectedIndex),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                /* Right Section */
                Expanded(
                  flex: 4,
                  child: YoutubeReviewContentsWheelSlider(youtubeVM: youtubeVM),
                ),
              ],
            ),
          ],
        );
      },
    );

    Positioned backButton() {
      return Positioned(
        left: 30,
        top: 10.8.sp,
        child: IconButton(
          iconSize: 13.5.sp,
          icon: SvgPicture.asset("assets/icons/arrow_left_ic.svg"),
          onPressed: () {
            routeAction();
          },
        ),
      );
    }
  }
}
