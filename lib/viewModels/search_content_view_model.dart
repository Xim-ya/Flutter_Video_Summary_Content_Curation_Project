import 'package:movie_curation/utilities/index.dart';

class SearchVM extends GetxController {
  int selectedGenre = 3210; // 선택된 장르
  List<Movie> selectedGenreMovies = [];

  // 선택된 장르 변경
  void setSelectedGenre(int index) {
    selectedGenre = index;
    update();
  }

  // 장르를 기준으로 영화 리스트 호출
  void fetchMoviesBasedOnGenre(int genreKey) async {
    List<Movie> movieList = await MovieApi().fetchMovieBasedOnGenre(genreKey);
    selectedGenreMovies = movieList;
    update();
  }

  /* Intents */

  void fetchAllContents() {
    print("전체");
  }

  void fetchGenreContents() {
    print("장르영화 : 선택된 장르의 키는");
  }

  void fetchRecommendedContents() {
    print("추천 영화");
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
        fetchGenreContents();
    }
    update();
  }
}
