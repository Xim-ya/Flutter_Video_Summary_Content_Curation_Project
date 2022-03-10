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

  // Intent - 내부 비즈니스 로직
  void updateCategoryIndex(int index) {
    selectedCategoryIndex = index;
    update();
  }

  void setSelectedMovie(int index) {
    selectedMovieIndex = index;
    update();
  }

  /* 네트워킹 */
  void fetchMovies() async {
    loadingStatus = LoadingStatus.empty;
    update();

    List<Movie> movieList = await MovieApi().fetchMovies();
    _model.movies = movieList.toList();
    update();

    loadingStatus =
        _model.movies.isEmpty ? LoadingStatus.empty : LoadingStatus.done;
    update();
  }
}
