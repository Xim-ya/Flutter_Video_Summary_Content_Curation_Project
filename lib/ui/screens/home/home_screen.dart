import 'package:movie_curation/utilities/index.dart';

class HomeScreen extends BaseScreen<HomeViewModel> {
  final VoidCallback routeAction; // PageViewBuilder 라우트 콜백 함수
  const HomeScreen({
    Key? key,
    required this.routeAction,
  }) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Obx(
      () => vm.selectedContentList != null
          ? Stack(
              children: [
                /* Content Gradient Bacgkround */
                GradientPostBackground(
                  backgroundImgUrl: vm.selectedMovieContent?.backDropUrl ??
                      vm.selectedMovieContent?.posterUrl,
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: contentTopP,
                      left: contentLeftP,
                      bottom: contentBottomP),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* Category Group Button */
                      const CategoryGroupButton(),
                      /* Content Content Info */
                      ContentInfoContainer(
                        isUsedOnHomeScreen: true,
                        routeAction: routeAction,
                      ),
                      /* Content Post Slider  */
                      const ContentPosterSlider()
                    ],
                  ),
                ),
              ],
            )
          : SizedBox(),
    );
  }
}
