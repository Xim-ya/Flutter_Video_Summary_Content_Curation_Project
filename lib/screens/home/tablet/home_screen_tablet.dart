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
    _movieVM.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("1");
    return GetBuilder<MovieVM>(
        init: _movieVM,
        builder: (_) {
          return Stack(children: [
            /* Content Image Background  (Image & Gradient Linear Background) */
            GradientPostBackground(movieVM: _movieVM),
            Container(
              padding: EdgeInsets.only(
                  top: contentTopP, left: contentLeftP, bottom: contentBottomP),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* Category Group Button */
                  CategoryGroupButton(movieVM: _movieVM),
                  /* Movie Content Info */
                  MovieContentInfo(
                      isRoutedMain: true,
                      routeAction: widget.routeAction,
                      movieVM: _movieVM),
                  /* Movie List Carousel Slider */
                  MovieListSlider(movieVM: _movieVM)
                ],
              ),
            ),
          ]);
        });
  }

  @override
  bool get wantKeepAlive => true;
}
