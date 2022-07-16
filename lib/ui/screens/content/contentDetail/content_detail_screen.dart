import 'package:movie_curation/utilities/index.dart';

class ContentDetailScreen extends BaseScreen<HomeViewModel> {
  const ContentDetailScreen({Key? key, required this.routeAction})
      : super(key: key);
  final VoidCallback routeAction;

  @override
  Widget buildScreen(BuildContext context) {
    return ContentDetailScaffold(
      background: GradientPostBackground(
          backgroundImgUrl: vm.selectedMovieContent?.posterUrl ??
              vm.selectedMovieContent?.backDropUrl),
      backArrowBtn: BackArrowButton(routeAction: routeAction),
      castSlider: CastSlider(castList: vm.contentCastList),
      contentInfo: ContentInfoContainer(
          isUsedOnHomeScreen: false, routeAction: routeAction),
      genreAndRateInfo: ContentElseInfo(
        genreList: vm.contentGenreList,
        rateScore: vm.selectedMovieContent?.voteAverage.toDouble(),
      ),
      contentWheelSlider: YoutubeReviewContentsWheelSlider(
        wheelScrollController: vm.wheelScrollController,
        youtubeSearchList: vm.youtubeSearchList,
      ),
    );
  }
}
