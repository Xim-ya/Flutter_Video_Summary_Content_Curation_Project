import 'package:movie_curation/utilities/index.dart';

class HomeScreenT extends StatefulWidget {
  final VoidCallback routeAction; // PageViewBuilder 라우트 콜백 함수

  const HomeScreenT({Key? key, required this.routeAction}) : super(key: key);
  @override
  State<HomeScreenT> createState() => _HomeScreenTState();
}

final _movieVM = Get.put(MovieVM(model: MovieCore()));

// "AutomaticKeepAliveClientMixin -> 화면 전화 시 기존 state값 유지"
class _HomeScreenTState extends State<HomeScreenT>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // 초기 데이터(인기 영화 리스트, 예고편) 호출
    _movieVM.fetchPopularMovieAndTrailer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieVM>(
      init: _movieVM,
      builder: (_) {
        // Alert Dialog 위젯 (영화 예고편)
        void _showDialog() async {
          _movieVM.trailerKey == null
              ? noTrailerDialog(context)
              : movieTrailerDialog(context, _movieVM);
        }

        return Stack(
          children: [
            /* Content Image Background  (Image & Gradient Linear Background) */
            GradientPostBackground(isRoutedMain: true, movieVM: _movieVM),
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
                    movieVM: _movieVM,
                    showDialog: _showDialog,
                  ),
                  /* Movie List Carousel Slider */
                  MoviePostSlider(movieVM: _movieVM)
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
