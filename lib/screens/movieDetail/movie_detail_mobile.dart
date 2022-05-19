import 'package:movie_curation/utilities/index.dart';

class MovieDetailScreenM extends StatelessWidget {
  final _movieVM = Get.put(MovieVM(model: MovieCore()));
  final _youtubeVM = Get.put(YoutubeVM(model: YoutubeCore()));

  void routeBackHandler() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    bool isFetched =
        _movieVM.loadingStatus == LoadingStatus.done ? true : false;
    int? selectedIndex = _movieVM.selectedMovieIndex;

    return Builder(
      builder: (_) {
        // Alert Dialog 위젯 (영화 예고편)
        void _showDialog() async {
          _movieVM.trailerKey == null
              ? noTrailerDialog(context)
              // : getToTrailerPlayer(_movieVM);
              : movieTrailerDialog(
                  context: context, movieVM: _movieVM, isUsedInMobile: true);
        }

        return Scaffold(
          backgroundColor: kDarkGrey,
          body: Stack(
            children: [
              GradientPostBackground(
                  movieVM: _movieVM, isRoutedMain: false, isUsedInMobile: true),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BackArrowButton(routeAction: routeBackHandler),
                      /* Movie Content Info */
                      MainContentInfoM(
                          isRoutedMain: false,
                          movieVM: _movieVM,
                          showDialog: _showDialog),
                      SizedBox(height: 20),
                      /* Actor(Cast) Slider */
                      CastSlider(movieVM: _movieVM, isUsedInMobile: true),

                      /* Else (Rate & Genre) */
                      MovieElseInfo(
                        isFetched: isFetched,
                        movieVM: _movieVM,
                        selectedIndex: selectedIndex,
                        isUsedInMobile: true,
                      ),

                      /* Youtube Contents */
                      YoutubeContentsListView(youtubeVM: _youtubeVM)
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
