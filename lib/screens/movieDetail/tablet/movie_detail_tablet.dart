import 'package:movie_curation/screens/movieDetail/localWidget/youtube_reviewCotents_wheel_slider.dart';
import 'package:movie_curation/utilities/index.dart';
import 'package:movie_curation/widgets/back_arrow_button.dart';

class MovieDetailScreenT extends StatelessWidget {
  final VoidCallback routeAction; //;

  const MovieDetailScreenT({Key? key, required this.routeAction})
      : super(key: key);

  void blankAction() {}

  @override
  Widget build(BuildContext context) {
    final youtubeVM = Get.put(YoutubeVM(model: YoutubeCore()));
    final movieVM = Get.put(MovieVM(model: MovieCore()));
    bool isFetched = movieVM.loadingStatus == LoadingStatus.done ? true : false;
    int? selectedIndex = movieVM.selectedMovieIndex;
    youtubeVM.fetchVideoLikesCount();

    print(19.6.w);

    return Builder(
      builder: (context) {
        // Alert Dialog 위젯 (영화 예고편)
        void _showDialog() async {
          movieVM.trailerKey == null
              ? noTrailerDialog(context)
              : movieTrailerDialog(context: context, movieVM: movieVM);
        }

        return Stack(
          children: [
            GradientPostBackground(isRoutedMain: false, movieVM: movieVM),
            BackArrowButton(routeAction: routeAction),
            Row(
              children: [
                /* Left Section */
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: contentTopP, left: kWS54, bottom: contentBottomP),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /* Movie Main Info  */
                        MovieContentInfo(
                            isRoutedMain: false,
                            movieVM: movieVM,
                            showDialog: _showDialog),
                        Expanded(
                          flex: 10,
                          child: Container(
                            padding: EdgeInsets.only(top: kCastDiverP),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /* Actor(Cast) Slider */
                                CastSlider(movieVM: movieVM),
                                /* Else (Rate & Genre) */
                                MovieElseInfo(
                                    isFetched: isFetched,
                                    movieVM: movieVM,
                                    selectedIndex: selectedIndex),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                /* Right Section */
                Expanded(
                    flex: 4,
                    child:
                        YoutubeReviewContentsWheelSlider(youtubeVM: youtubeVM)),
              ],
            ),
          ],
        );
      },
    );
  }

  Positioned backButton() {
    return Positioned(
      left: 30,
      top: 10.8.sp,
      child: IconButton(
        iconSize: 13.5.sp,
        icon: SvgPicture.asset("assets/icons/arrow_left_ic.svg"),
        onPressed: () {
          routeAction();
        },
      ),
    );
  }
}
