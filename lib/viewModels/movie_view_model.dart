import 'package:movie_curation/services/movie_api_response.dart';
import 'package:movie_curation/utilities/index.dart';

enum LoadingStatus { done, empty }

class MovieVM extends GetxController {
  int selectedCategoryIndex = 0;
  int? selectedMovieIndex;
  String? trailerKey;

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

  List<Actor> get actorList {
    return _model.actors;
  }

  Trailer? get trailer {
    return _model.trailer;
  }

  YoutubePlayerController get youtubeController {
    return YoutubePlayerController(
      initialVideoId: trailerKey ?? "0",
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  /* Intent - 내부 비즈니스 로직 */

  void setYoutubeId() {
    trailerKey = "mI9oyFMUlfg";
    update();
  }

  void updateCategoryIndex(int index) {
    selectedCategoryIndex = index;
    update();
  }

  void setSelectedMovie(int index) {
    selectedMovieIndex = index;
    update();
  }

  /* 네트워킹 */

  void fetchPopularMovieAndTrailer() async {
    List<Movie> movieList = await MovieApi().fetchPopularMovies();
    _model.movies = movieList.toList();
    update();

    final movieId = _model.movies[0].id;
    fetchTrailer(movieId.toInt());
    update();

    loadingStatus =
        _model.movies.isEmpty ? LoadingStatus.empty : LoadingStatus.done;
    update();
  }

  // 인기 영화
  Future<void> fetchPopularMovie() async {
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

  // 선택된 영화의 출연진 (Cast Actors)
  void fetchActors(int movieId) async {
    List<Actor> actorList = await MovieApi().fetchActors(movieId);
    _model.actors = actorList;
  }

  // 선택된 영화 예고편
  void fetchTrailer(int movieId) async {
    List<Trailer> trailerList = await MovieApi().fetchTrailer(movieId);
    if (trailerList.isNotEmpty) {
      _model.trailer = trailerList[0]; // 하나의 예고편만]
      trailerKey = trailerList[0].key;
    } else {
      trailerKey = null;
    }
    update();
  }
}
