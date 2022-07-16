import 'package:flutter/cupertino.dart';
import 'package:movie_curation/ui/screens/content/contentDetail/localWidget/youtube_review_contents_wheel_slider.dart';
import 'package:movie_curation/ui/widgets/content_info_container.dart';
import 'package:movie_curation/utilities/responsive_size.dart';

/* 2022.07.16 Created by Ximya
*  컨텐츠 상세 페이지 Scaffold.
* */

class ContentDetailScaffold extends StatelessWidget {
  const ContentDetailScaffold(
      {Key? key,
      required this.background,
      required this.backArrowBtn,
      required this.castSlider,
      required this.contentInfo,
      required this.genreAndRateInfo,
      required this.contentWheelSlider})
      : super(key: key);
  final Widget background;
  final Widget backArrowBtn;
  final Widget castSlider;
  final Widget contentInfo;
  final Widget genreAndRateInfo;
  final Widget contentWheelSlider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /* Poster Background Container (shows poster img) */
        background,
        backArrowBtn,
        // BackArrowButton(routeAction: routeAction),

        // ContentInfoContainer(
        //     isUsedOnHomeScreen: false, routeAction: routeAction),
        Row(
          children: [
            /* Left Section */
            _LeftSection(
              contentInfo: contentInfo,
              genreAndRateInfo: genreAndRateInfo,
              castSlider: castSlider,
            ),
            /* Right Section */
            _RightSection(contentWheelSlider: contentWheelSlider)
            // Expanded(
            //   flex: 4,
            //   child: YoutubeReviewContentsWheelSlider(),
            // ),
          ],
        ),
      ],
    );
  }
}

class _RightSection extends StatelessWidget {
  const _RightSection({Key? key, required this.contentWheelSlider})
      : super(key: key);

  final Widget contentWheelSlider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: contentWheelSlider,
      // YoutubeReviewContentsWheelSlider(),
    );
  }
}

class _LeftSection extends StatelessWidget {
  const _LeftSection(
      {Key? key,
      required this.contentInfo,
      required this.castSlider,
      required this.genreAndRateInfo})
      : super(key: key);

  final Widget contentInfo;
  final Widget castSlider;
  final Widget genreAndRateInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.only(
            top: contentTopP, left: kWS54, bottom: contentBottomP),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /* Content Main Info  */
            contentInfo,
            // ContentInfoContainer(
            //     isUsedOnHomeScreen: false, routeAction: routeAction),
            Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.only(top: kCastDiverP),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /* Actor(Cast) Slider */
                    castSlider,
                    // Obx(() => vm.contentCastList == null
                    //     ? const SizedBox()
                    //     : CastSlider(castList: vm.contentCastList!)),

                    /* Else (Rate & Genre) */
                    genreAndRateInfo,
                    // ContentElseInfo(
                    //   genreList: vm.contentGenreList,
                    //   rateScore: vm.selectedMovieContent?.voteAverage
                    //       .toDouble(),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
