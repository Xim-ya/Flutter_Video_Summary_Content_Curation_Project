import 'package:movie_curation/utilities/index.dart';

enum LoadingStatus { done, empty }

class MovieVM extends GetxController {
  int selectedCategoryIndex = 0; // [인기, 최신, 추천] 카테고리 옵션
  int? selectedMovieIndex; // 선택된 영화의 리스트 인덱스
  String? trailerKey; // 예고편 영화의 키값
  LoadingStatus loadingStatus = LoadingStatus.empty; // API response 응답 여부.
  int? selectedMovieId;

  /* Model과 연동 */
  MovieCore _model;
  MovieVM({required MovieCore model}) : _model = model;

  /* 인스턴스 */
  List<Movie> get movieList {
    return _model.movies;
  }

  List<Genres> get movieGenreList {
    return _model.movieGenre;
  }

  List<Actor> get actorList {
    return _model.actors;
  }

  List<dynamic> get selectedCategoryContents {
    return selectedCategoryIndex == 0 ? _model.movies : _model.dramas;
  }

  // YoutubeController -> videoID를 동적으로 넘겨주기 위해서는 ViewModel에서 관리 필요
  YoutubePlayerController get trailerYoutubeController {
    return YoutubePlayerController(
      initialVideoId: trailerKey ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
  }

  YoutubePlayerController get movieReviewController {
    return YoutubePlayerController(
      initialVideoId: trailerKey ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
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

  // 인기 영화 리스트와 해당 리스트의 첫 영화의 예고편 데이터 호출.
  // 홈스크린으로 처음 Route 될 때 필요한 네트워킹 로직
  void fetchPopularMovieAndTrailer() async {
    // 1. Fetch Popular Movie List
    List<Movie> movieList = await MovieApi().fetchPopularMovies();
    _model.movies = movieList.toList();
    update();

    // 2. Fetch Selected Movie Trailer, The First One
    final movieId = _model.movies[0].id;
    fetchTrailer(movieId.toInt(), null);
    update();

    // 3. Set Loading Status if MovieList Fetched
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

  // 인기 드라마
  Future<void> fetchPopularDrama() async {
    loadingStatus = LoadingStatus.empty;
    update();

    List<Drama> dramaList = await MovieApi().fetchPopularDrama();
    _model.dramas = dramaList.toList();
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
  void fetchTrailer(int movieId, VoidCallback? showTrailer) async {
    List<Trailer> trailerList = await MovieApi().fetchTrailer(movieId);
    // 1. 예고편 Youtube Key 값이 존재한다면 예고편 리스트 중 첫 번째 Key값을 반환
    trailerList.isNotEmpty
        ? trailerKey = trailerList[0].key
        : trailerKey = null;
    // 2. YoutubeController은 전달 받은 key 값으로 에고편 Dialog을 보여주는 메소드를 실행
    showTrailer != null ? showTrailer() : null;
    update();
  }
}
