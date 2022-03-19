import 'package:movie_curation/utilities/index.dart';

class MovieDetailScreenT extends StatefulWidget {
  final VoidCallback routeAction; //;
  const MovieDetailScreenT({Key? key, required this.routeAction})
      : super(key: key);

  @override
  State<MovieDetailScreenT> createState() => _MovieDetailScreenTState();
}

final youtubeVM = Get.put(YoutubeVM(model: YoutubeCore()));

class _MovieDetailScreenTState extends State<MovieDetailScreenT> {
  @override
  void initState() {
    youtubeVM.fetchYoutubeSearchQuery("멋진 히어로");
    super.initState();
  }

  void blankAction() {}

  @override
  Widget build(BuildContext context) {
    final movieVM = Get.put(MovieVM(model: MovieCore()));
    bool isFetched = movieVM.loadingStatus == LoadingStatus.done ? true : false;
    int? selectedIndex = movieVM.selectedMovieIndex;

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
                leftSide(
                    movieVM, _showDialog, kTS100, isFetched, selectedIndex),
                /* Right Side */
                Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: kWS100),
                      child: GetBuilder<YoutubeVM>(
                          init: youtubeVM,
                          builder: (context) {
                            return ListWheelScrollView(
                              diameterRatio: 20,
                              itemExtent: 500,
                              children: [
                                ...youtubeVM.youtubeSearchedQueryList.map(
                                  (query) {
                                    return Column(
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: Stack(
                                            children: [
                                              /* Thumbnail Image */
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(11),
                                                child: CachedNetworkImage(
                                                  imageUrl: query.snippet
                                                      .thumbnails.medium.url,
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
                                              /* Linear Background */
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(11),
                                                  gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: <Color>[
                                                      Colors.black
                                                          .withOpacity(0.7),
                                                      kDarkGrey
                                                          .withOpacity(0.3),
                                                      kDarkGrey
                                                          .withOpacity(0.15),
                                                      kDarkGrey
                                                          .withOpacity(0.1),
                                                    ],
                                                    tileMode: TileMode.clamp,
                                                  ),
                                                ),
                                              ),
                                              /* Likes Icon  */
                                              Positioned(
                                                bottom: 20,
                                                left: 20,
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/icons/like_ic.svg"),
                                                    SizedBox(width: 10),
                                                    Text("632",
                                                        style: FontStyles()
                                                            .youtubeReviewLikes)
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                right: 20,
                                                top: 20,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Container(
                                                      height: 44,
                                                      width: 44,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        /* Youtube Content Title  */
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text(query.snippet.title,
                                              maxLines: 2,
                                              style: FontStyles(kTS22)
                                                  .youtubeReviewTitle),
                                        )
                                      ],
                                    );
                                  },
                                )
                              ],
                            );
                          }),
                    )),
              ],
            ),
          ),
        ],
      );
    });
  }

  Expanded leftSide(MovieVM movieVM, void _showDialog(), double castSize,
      bool isFetched, int? selectedIndex) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.only(
            top: contentTopP, left: kWS54, bottom: contentBottomP),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MovieContentInfo(
                isRoutedMain: false, movieVM: movieVM, showDialog: _showDialog),
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
                            final castItem = movieVM.actorList[index];
                            return Container(
                              margin: EdgeInsets.only(right: 22),
                              child: Stack(
                                children: [
                                  /* Actor Image */
                                  Container(
                                    height: castSize,
                                    width: castSize,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(1000),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "https://image.tmdb.org/t/p/w500${castItem.profilePath}",
                                        imageBuilder:
                                            (context, imageProvider) =>
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
                                        errorWidget: (context, url, error) =>
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
                                        style: FontStyles(kTS16).actorName,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /* Rate Section */
                          Wrap(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    isFetched
                                        ? movieVM.movieList[selectedIndex ?? 0]
                                            .voteAverage
                                            .toString()
                                        : "",
                                    style: FontStyles(kTS50).categoryTitle,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 8, bottom: 10),
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
                                    style: FontStyles(kTS22).categorySubTitle),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          /* Genre Title */
                          Text("Genre", style: FontStyles(kTS50).categoryTitle),
                          /* Genre List */
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            height: kTS50,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: movieVM.movieGenreList.length,
                              itemBuilder: (context, index) {
                                return Text(
                                    "${movieVM.movieGenreList[index].name}",
                                    style: FontStyles(kTS22).categorySubTitle);
                              },
                              separatorBuilder: (context, index) => Text("/ ",
                                  style: FontStyles(kTS22).categorySubTitle),
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
          widget.routeAction();
        },
      ),
    );
  }
}
