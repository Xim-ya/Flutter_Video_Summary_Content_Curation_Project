import 'package:movie_curation/ui/screens/content/contentDetail/content_detail_scaffold.dart';
import 'package:movie_curation/utilities/index.dart';

class ContentDetailNewScreen extends BaseScreen<HomeViewModel> {
  const ContentDetailNewScreen({Key? key, required this.routeAction})
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
