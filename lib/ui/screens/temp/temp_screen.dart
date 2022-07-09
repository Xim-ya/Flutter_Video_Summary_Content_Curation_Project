import 'package:movie_curation/ui/common/base/base_screen.dart';
import 'package:movie_curation/ui/screens/home/home_view_model_new.dart';
import 'package:movie_curation/utilities/index.dart';

class TempHomeScreen extends BaseScreen<HomeViewModelNew> {
  final VoidCallback routeAction; // PageViewBuilder 라우트 콜백 함수
  const TempHomeScreen({
    Key? key,
    required this.routeAction,
  }) : super(key: key);

  // final VoidCallback? routeAction; // PageViewBuilder 라우트 콜백 함수

  @override
  Widget buildScreen(BuildContext context) {
    return Obx(() => Stack(children: [
          GradientPostBackground(
            backgroundImgUrl: vm.selectedMovieContent?.backDropUrl ??
                vm.selectedMovieContent?.posterUrl,
          ),
          Container(
            padding: EdgeInsets.only(
                top: contentTopP, left: contentLeftP, bottom: contentBottomP),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* Category Group Button */
                const CategoryGroupButton(),
                /* Movie Content Info */
                ContentInfoContainer(
                  isUsedOnHomeScreen: true,
                  title: vm.selectedMovieContent?.title,
                  description: vm.selectedMovieContent?.overview,
                  routeAction: routeAction,
                ),
                /* Movie List Carousel Slider */
                const ContentPosterSlider()
              ],
            ),
          ),
        ]
            /* Content Image Background  (Image & Gradient Linear Background) */
            // GradientPostBackground(
            //   isRoutedMain: true,
            //   backDropPosterImgUrl: vm.popularMovieList![0].backDropUrl,
            // ),
            // Container(
            //   padding: EdgeInsets.only(
            //       top: contentTopP, left: contentLeftP, bottom: contentBottomP),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       /* Category Group Button */
            //       CategoryGroupButton(movieVM: _movieVM),
            //       /* Movie Content Info */
            //       MovieContentInfo(
            //         isRoutedMain: true,
            //         routeAction: widget.routeAction,
            //         movieVM: _movieVM,
            //         showDialog: _showDialog,
            //       ),
            //       /* Movie List Carousel Slider */
            //       MoviePostSlider(movieVM: _movieVM)
            //     ],
            //   ),
            // ),

            ));
  }
}
