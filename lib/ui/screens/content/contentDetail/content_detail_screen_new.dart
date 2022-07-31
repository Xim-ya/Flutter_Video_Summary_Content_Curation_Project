import 'package:movie_curation/utilities/index.dart';

class ContentDetailScreenNew extends StatelessWidget {
  const ContentDetailScreenNew({
    Key? key,
    required this.posterUrl,
    required this.backDropUrl,
    required this.routeAction,
    required this.contentCastList,
    required this.title,
    required this.releaseDate,
    required this.adult,
    required this.overView,
    required this.showContentTrailer,
    required this.contentGenreList,
    required this.voteAverage,
    required this.wheelScrollController,
    required this.youtubeSearchList,
  }) : super(key: key);

  final String? posterUrl;
  final String? backDropUrl;
  final VoidCallback routeAction;
  final List<ContentCastModel>? contentCastList;
  final String? title;
  final String? releaseDate;
  final bool? adult;
  final String? overView;
  final VoidCallback showContentTrailer;
  final List<String>? contentGenreList;
  final num? voteAverage;
  final ScrollController wheelScrollController;
  final List<YoutubeVideoContentModel>? youtubeSearchList;

  @override
  Widget build(BuildContext context) {
    return ContentDetailScaffold(
      background:
          GradientPostBackground(backgroundImgUrl: posterUrl ?? backDropUrl),
      backArrowBtn: BackArrowButton(routeAction: routeAction),
      castSlider: Obx(() => CastSlider(castList: contentCastList)),
      contentInfo: ContentInfoContainer(
          title: title,
          releaseDate: releaseDate,
          adult: adult,
          overView: overView,
          isUsedOnHomeScreen: false,
          showTrailerDialog: showContentTrailer,
          routeAction: routeAction),
      genreAndRateInfo: ContentElseInfo(
        genreList: contentGenreList,
        rateScore: voteAverage?.toDouble(),
      ),
      contentWheelSlider: Obx(
        () => YoutubeReviewContentsWheelSlider(
          wheelScrollController: wheelScrollController,
          youtubeSearchList: youtubeSearchList,
        ),
      ),
    );
  }
}
