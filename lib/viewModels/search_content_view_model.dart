import 'package:movie_curation/utilities/index.dart';

class SearchVM extends GetxController {
  int selectedGenre = 3210; // 선택된 장르
  List<Movie> selectedGenreMovies = [];

  /* Model과 연동 */
  final SearchCore _model;
  SearchVM({required SearchCore model}) : _model = model;

  /* 인스턴스 */
  List<Movie> get selectedMovies {
    return _model.selectedMovies;
  }

  /* Intents */
  // 선택된 장르 변경
  void setSelectedGenre(int index) {
    selectedGenre = index;
    update();
  }

  /* 네트워킹 */
  void fetchAllContents() async {
    List<Movie> movieList = await MovieApi().fetchPopularMovies();
    _model.selectedMovies = movieList.toList();
    update();
  }

  void fetchGenreContents(int key) {
    print("장르영화 : 선택된 장르의 키는");
  }

  void fetchRecommendedContents() {
    print("추천 영화");
  }

  // 장르를 기준으로 영화 리스트 호출
  void fetchMoviesBasedOnGenre(int genreKey) async {
    List<Movie> movieList = await MovieApi().fetchMovieBasedOnGenre(genreKey);
    selectedGenreMovies = movieList;
    update();
  }

  //
  void loadMoreMovie(ScrollController controller) {
    if (controller.position.maxScrollExtent == controller.offset) {}
  }

  void tapGroupButton(int buttonKey) {
    selectedGenre = buttonKey;
    switch (buttonKey) {
      case 3210:
        fetchAllContents();
        break;
      case 3211:
        fetchRecommendedContents();
        break;
      default:
        fetchGenreContents(buttonKey);
    }
    update();
  }
}
