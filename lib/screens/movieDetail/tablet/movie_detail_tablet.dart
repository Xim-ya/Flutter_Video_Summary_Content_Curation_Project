import 'package:movie_curation/utilities/index.dart';

class MovieDetailScreenT extends StatelessWidget {
  final VoidCallback routeAction; //;
  const MovieDetailScreenT({Key? key, required this.routeAction})
      : super(key: key);

  void blankAction() {}

  @override
  Widget build(BuildContext context) {
    final movieVM = Get.put(MovieVM(model: MovieCore()));
    bool isFetched = movieVM.loadingStatus == LoadingStatus.done ? true : false;
    int? selectedIndex = movieVM.selectedMovieIndex;
    final castSize = 26.6.sp;
    print(6.5.sp);
    return Stack(
      children: [
        GradientPostBackground(isRoutedMain: false, movieVM: movieVM),
        backButton(),
        Container(
          child: Row(
            children: [
              /* Left Side */
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(
                      top: contentTopP,
                      left: contentLeftP,
                      bottom: contentBottomP),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieContentInfo(
                          isRoutedMain: false,
                          routeAction: blankAction,
                          movieVM: movieVM),
                      Expanded(
                        flex: 10,
                        child: Container(
                          padding: EdgeInsets.only(top: kCastDiverP),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /* Actor(Cast) Slider */
                              Container(
                                height: castSize + (kTS16 * 2) + 9,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(right: 22),
                                        child: Stack(
                                          children: [
                                            /* Actor Image */
                                            Container(
                                              height: castSize,
                                              width: castSize,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(1000),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "https://image.tmdb.org/t/p/w500${movieVM.movieList[index].posterUrl}",
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                            /* Actor Name */
                                            Positioned(
                                              top: castSize + 4,
                                              child: Container(
                                                width: castSize + 4,
                                                child: Text(
                                                  "James ",
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: FontStyles(kTS16)
                                                      .actorName,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              /* Else (Rated...) */
                              Container(
                                child: Column(
                                  children: [
                                    /* Rate Section */
                                    Wrap(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              isFetched
                                                  ? movieVM
                                                      .movieList[
                                                          selectedIndex ?? 0]
                                                      .voteAverage
                                                      .toString()
                                                  : "",
                                              style:
                                                  FontStyles(kTS50).rateTitle,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 8, bottom: 10),
                                              child: SvgPicture.asset(
                                                "assets/icons/yellow_star_ic.svg",
                                              ),
                                            )
                                          ],
                                        ),
                                        Text("RATE",
                                            style:
                                                FontStyles(kTS22).rateSubTitle)
                                      ],
                                    ),

                                    /* Movie Genre */
                                    // Container(
                                    //   height: 100,
                                    //   child: ListView.builder(
                                    //     scrollDirection: Axis.horizontal,
                                    //     itemCount:
                                    //         movieVM.movieGenreList.length
                                    //     itemBuilder: (context, index) {
                                    //       return Text(movieVM.movieGenreList[0].genres
                                    //           .toString());
                                    //     },
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              /* Right Side */
              Expanded(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        ),
      ],
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
