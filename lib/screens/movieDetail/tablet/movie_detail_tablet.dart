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

    return Builder(builder: (context) {
      // Alert Dialog 위젯 (영화 예고편)
      void _showDialog() async {
        movieVM.trailerKey == null
            ? noTrailerDialog(context)
            : movieTrailerDialog(context, movieVM);
      }

      return Stack(
        children: [
          GradientPostBackground(isRoutedMain: false, movieVM: movieVM),
          backButton(),
          Container(
            child: Row(
              children: [
                /* Left Side */
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: contentTopP, left: kWS54, bottom: contentBottomP),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                Container(
                                  height: castSize + (kTS16 * 2) + 9,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: movieVM.actorList.length,
                                      itemBuilder: (context, index) {
                                        final castItem =
                                            movieVM.actorList[index];
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
                                                      BorderRadius.circular(
                                                          1000),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        "https://image.tmdb.org/t/p/w500${castItem.profilePath}",
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
                                                    placeholder: (context,
                                                            url) =>
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
                                                    castItem.name ?? "익명",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                style: FontStyles(kTS50)
                                                    .categoryTitle,
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
                                          GestureDetector(
                                            onTap: () {
                                              print(movieVM.movieGenreList);
                                            },
                                            child: Text("RATE",
                                                style: FontStyles(kTS22)
                                                    .categorySubTitle),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      /* Genre Title */
                                      Text("Genre",
                                          style:
                                              FontStyles(kTS50).categoryTitle),
                                      /* Genre List */
                                      Container(
                                        margin: EdgeInsets.only(top: 4),
                                        height: kTS50,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              movieVM.movieGenreList.length,
                                          itemBuilder: (context, index) {
                                            return Text(
                                                "${movieVM.movieGenreList[index].name}",
                                                style: FontStyles(kTS22)
                                                    .categorySubTitle);
                                          },
                                          separatorBuilder: (context, index) =>
                                              Text("/ ",
                                                  style: FontStyles(kTS22)
                                                      .categorySubTitle),
                                        ),
                                      )
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
                  flex: 4,
                  child: Container(),
                )
              ],
            ),
          ),
        ],
      );
    });
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
