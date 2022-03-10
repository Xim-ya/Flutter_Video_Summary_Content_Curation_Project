import 'package:movie_curation/services/movie_api_response.dart';
import 'package:movie_curation/utilities/index.dart';

enum LoadingStatus { done, empty }

class MovieVM extends GetxController {
  int selectedCategoryIndex = 0;

  // Model과 연동
  MovieCore _model;
  MovieVM({required MovieCore model}) : _model = model;

  LoadingStatus loadingStatus = LoadingStatus.empty;

  List<Movie> get movieList {
    return _model.movies;
  }

  void updateCategoryIndex(int index) {
    selectedCategoryIndex = index;
    update();
  }

  /* 네트워킹 */
  void fetchMovies() async {
    loadingStatus = LoadingStatus.empty;
    update();

    List<Movie> movieList = await MovieApi().fetchMovies();
    _model.movies = movieList.toList();
    update();
  }
}
