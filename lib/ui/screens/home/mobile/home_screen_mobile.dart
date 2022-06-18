import 'package:movie_curation/ui/screens/home/localWidget/poster_carousel_slider.dart';
import 'package:movie_curation/utilities/index.dart';

class HomeScreenM extends StatefulWidget {
  @override
  State<HomeScreenM> createState() => _HomeScreenMState();
}

final _movieVM = Get.put(MovieVM(model: MovieCore()));

class _HomeScreenMState extends State<HomeScreenM> {
  @override
  void initState() {
    _movieVM.fetchPopularMovieAndTrailer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void routeAction() {
      Get.to(() => MovieDetailScreenM());
    }

    return GetBuilder<MovieVM>(
      init: _movieVM,
      builder: (_) {
        // Alert Dialog 위젯 (영화 예고편)
        void _showDialog() async {
          _movieVM.trailerKey == null
              ? noTrailerDialog(context)
              // : getToTrailerPlayer(_movieVM);
              : movieTrailerDialog(
                  context: context, movieVM: _movieVM, isUsedInMobile: true);
        }

        return Stack(
          children: [
            GradientPostBackground(
                movieVM: _movieVM, isRoutedMain: false, isUsedInMobile: true),
            SafeArea(
              child: Container(
                child: Column(
                  children: [
                    /* Category Group Button */
                    CategoryGroupButton(
                        movieVM: _movieVM, isUsedInMobile: true),
                    /* Movie Content Info */
                    MovieContentInfo(
                      isRoutedMain: true,
                      routeAction: routeAction,
                      movieVM: _movieVM,
                      showDialog: _showDialog,
                      isUsedInMobile: true,
                    ),
                    PosterCarouselSlider(movieVM: _movieVM)
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
