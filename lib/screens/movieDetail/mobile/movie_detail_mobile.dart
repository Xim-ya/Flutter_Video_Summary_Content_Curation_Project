import 'package:movie_curation/utilities/index.dart';

class MovieDetailScreenM extends StatelessWidget {
  final _movieVM = Get.put(MovieVM(model: MovieCore()));
  final _youtubeVM = Get.put(YoutubeVM(model: YoutubeCore()));
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
                      BackArrowButton(routeAction: Get.back),
                      /* Movie Content Info */
                      MainContentInfoM(
                          isRoutedMain: false,
                          movieVM: _movieVM,
                          showDialog: _showDialog),
                      SizedBox(height: 20),
                      /* Actor(Cast) Slider */
                      GetBuilder<MovieVM>(
                        init: _movieVM,
                        builder: (context) {
                          return CastSlider(
                              movieVM: _movieVM, isUsedInMobile: true);
                        },
                      ),
                      /* Else (Rate & Genre) */

                      /* Youtube Contents */
                      // GetBuilder<YoutubeVM>(
                      //     init: _youtubeVM,
                      //     builder: (context) {
                      //       return ListView.builder(
                      //         shrinkWrap: true,
                      //         itemCount:
                      //             _youtubeVM.youtubeSearchedQueryList.length,
                      //         itemBuilder: (context, index) {
                      //           final youtubeContent =
                      //               _youtubeVM.youtubeSearchedQueryList[index];
                      //           return Container(
                      //             child: Column(
                      //               children: [
                      //                 thumbnailImage(youtubeContent),
                      //                 Text(
                      //                   youtubeContent.snippet.title,
                      //                   style: TextStyle(color: Colors.white),
                      //                 ),
                      //               ],
                      //             ),
                      //           );
                      //         },
                      //       );
                      //     }),
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

  /* Thumbnail Image */
  ClipRRect thumbnailImage(Youtube query) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: CachedNetworkImage(
        imageUrl: query.snippet.thumbnails.medium.url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    );
  }
}
