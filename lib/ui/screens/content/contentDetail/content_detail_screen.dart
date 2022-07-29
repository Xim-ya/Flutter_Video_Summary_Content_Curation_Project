import 'package:movie_curation/utilities/index.dart';

class ContentDetailScreen extends BaseScreen<ContentDetailViewModel> {
  const ContentDetailScreen({Key? key, required this.routeAction})
      : super(key: key);
  final VoidCallback routeAction;

  @override
  Widget buildScreen(BuildContext context) {
    return ContentDetailScaffold(
      background: GradientPostBackground(
          backgroundImgUrl:
              vm.selectedContent?.posterUrl ?? vm.selectedContent?.backDropUrl),
      backArrowBtn: BackArrowButton(routeAction: routeAction),
      castSlider: Obx(() => CastSlider(castList: vm.contentCastList)),
      contentInfo: ContentInfoContainer(
          title: vm.selectedContent?.title,
          releaseDate: vm.selectedContent?.releaseDate,
          adult: vm.selectedContent?.adult,
          overView: vm.selectedContent?.overview,
          isUsedOnHomeScreen: false,
          showTrailerDialog: vm.showContentTrailer,
          routeAction: routeAction),
      genreAndRateInfo: ContentElseInfo(
        genreList: vm.contentGenreList,
        rateScore: vm.selectedContent?.voteAverage.toDouble(),
      ),
      contentWheelSlider: Obx(
        () => YoutubeReviewContentsWheelSlider(
          wheelScrollController: vm.wheelScrollController,
          youtubeSearchList: vm.youtubeSearchList,
        ),
      ),
    );
  }
}
