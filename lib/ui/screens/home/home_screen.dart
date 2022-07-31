import 'package:movie_curation/utilities/index.dart';
import 'package:movie_curation/utilities/regex.dart';

class HomeScreen extends BaseScreen<HomeViewModel> {
  final VoidCallback routeAction; // PageViewBuilder 라우트 콜백 함수
  const HomeScreen({
    Key? key,
    required this.routeAction,
  }) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Obx(
      () => HomeViewModel.selectedContentList != null && vm.loading.isFalse
          ? Stack(
              children: [
                /* Content Gradient Bacgkround */
                GradientPostBackground(
                  backgroundImgUrl: vm.selectedContent?.backDropUrl ??
                      vm.selectedContent?.posterUrl,
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
                      Obx(
                        () => ContentInfoContainer(
                          title: vm.selectedContent?.title,
                          overView: vm.selectedContent?.overview,
                          releaseDate: vm.selectedContent?.releaseDate,
                          showTrailerDialog: vm.showContentTrailer,
                          isUsedOnHomeScreen: true,
                          routeAction: routeAction,
                          adult: vm.selectedContent?.adult,
                        ),
                      ),
                      /* Content Post Slider  */
                      const ContentPosterSlider()
                    ],
                  ),
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
