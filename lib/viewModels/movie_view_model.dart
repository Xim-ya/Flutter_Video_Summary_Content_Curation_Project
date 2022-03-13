import 'package:movie_curation/services/movie_api_response.dart';
import 'package:movie_curation/utilities/index.dart';

enum LoadingStatus { done, empty }

class MovieVM extends GetxController {
  int selectedCategoryIndex = 0;
  int? selectedMovieIndex;

  // Model과 연동
  MovieCore _model;
  MovieVM({required MovieCore model}) : _model = model;

  LoadingStatus loadingStatus = LoadingStatus.empty;

  List<Movie> get movieList {
    return _model.movies;
  }

  List<Genres> get movieGenreList {
    return _model.movieGenre;
  }

  /* Intent - 내부 비즈니스 로직 */

  void updateCategoryIndex(int index) {
    selectedCategoryIndex = index;
    update();
  }

  void setSelectedMovie(int index) {
    selectedMovieIndex = index;
    update();
  }

  /* 네트워킹 */
  // 인기 영화
  void fetchPopularMovie() async {
    loadingStatus = LoadingStatus.empty;
    update();

    List<Movie> movieList = await MovieApi().fetchPopularMovies();
    _model.movies = movieList.toList();
    update();

    loadingStatus =
        _model.movies.isEmpty ? LoadingStatus.empty : LoadingStatus.done;
    update();
  }

  // 선택된 영화의 장르
  void fetchGenre(int movieId) async {
    List<Genres> movieGenreList = await MovieApi().fetchMovieGenre(movieId);
    _model.movieGenre = movieGenreList;
    update();
  }
}
