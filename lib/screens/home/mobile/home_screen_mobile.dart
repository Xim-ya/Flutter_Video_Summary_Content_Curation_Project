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
    print("HEIGHT  ${4.5.h}");

    void tempAction() {
      print("SOME ROUTES");
    }

    void _showDialog() async {
      _movieVM.trailerKey == null
          ? noTrailerDialog(context)
          : movieTrailerDialog(context, _movieVM);
    }

    return GetBuilder<MovieVM>(
      init: _movieVM,
      builder: (context) {
        return Stack(
          children: [
            GradientPostBackground(
                movieVM: _movieVM, isRoutedMain: false, isUsedInMobile: true),
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    /* Category Group Button */
                    CategoryGroupButton(
                        movieVM: _movieVM, isUsedInMobile: true),
                    /* Movie Content Info */
                    MovieContentInfo(
                      isRoutedMain: true,
                      routeAction: tempAction,
                      movieVM: _movieVM,
                      showDialog: _showDialog,
                      isUsedInMobile: true,
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                        color: Colors.blue.withOpacity(0.5),
                      ),
                    ),
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
