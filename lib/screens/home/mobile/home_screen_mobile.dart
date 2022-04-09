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
    return Container(
      child: Stack(
        children: [
          GradientPostBackground(
              movieVM: _movieVM, isRoutedMain: false, isUsedInMobile: true)
        ],
      ),
    );
  }
}
