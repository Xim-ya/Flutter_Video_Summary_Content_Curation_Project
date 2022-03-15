import 'package:movie_curation/utilities/index.dart';

class HomeScreenT extends StatefulWidget {
  final VoidCallback routeAction; //

  const HomeScreenT({Key? key, required this.routeAction}) : super(key: key);
  @override
  State<HomeScreenT> createState() => _HomeScreenTState();
}

/* 터치 특정 슬라이더 아이템으로 이동하는 controller & listener  (부모 위젯에서 관리) */
final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();
final _movieVM = Get.put(MovieVM(model: MovieCore()));

class _HomeScreenTState extends State<HomeScreenT>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // _movieVM.fetchPopularMovie();
    _movieVM.fetchPopularMovieAndTrailer();

    super.initState();
  }

  /* 예고편 */

  @override
  Widget build(BuildContext context) {
    print("1");
    return GetBuilder<MovieVM>(
        init: _movieVM,
        builder: (_) {
          void _showDialog() async {
            _movieVM.trailerKey == null
                ? showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("예고편이 없습니다"),
                      );
                    },
                  )
                : showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.all(200),
                        color: Colors.white,
                        child: YoutubePlayer(
                          controller: _movieVM.youtubeController,
                          showVideoProgressIndicator: true,
                        ),
                      );
                    },
                  );
          }

          return Stack(
            children: [
              /* Content Image Background  (Image & Gradient Linear Background) */
              GradientPostBackground(isRoutedMain: true, movieVM: _movieVM),
              Container(
                padding: EdgeInsets.only(
                    top: contentTopP,
                    left: contentLeftP,
                    bottom: contentBottomP),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* Category Group Button */
                    CategoryGroupButton(movieVM: _movieVM),
                    /* Movie Content Info */
                    MovieContentInfo(
                      isRoutedMain: true,
                      routeAction: widget.routeAction,
                      movieVM: _movieVM,
                      showDialog: _showDialog,
                    ),
                    /* Movie List Carousel Slider */
                    MovieListSlider(movieVM: _movieVM),
                  ],
                ),
              ),
              /* 예고편 Alert Dialog */
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      final selectedIndex = _movieVM.selectedMovieIndex ?? 0;
                      print(_movieVM.movieList[selectedIndex].title);
                    },
                    child: Text("ALRET DIALOG")),
              )
            ],
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
