import 'package:movie_curation/utilities/index.dart';

class TmdbRemoteDataSourceImpl
    with ApiErrorHandlerMixin
    implements TmdbRemoteDataSource {
  TmdbRemoteDataSourceImpl(this._api);

  final TmdbApi _api;

  /* TMDB - 인기 영화 호출 */
  @override
  Future<TmdbMovieResponse> loadPopularMovie() =>
      loadResponseOrThrow(() => _api.loadPopularMovie());

  /* TMDB - 인기 드라마 호출 */
  @override
  Future<TmdbPopularDramaResponse> loadPopularDrama() =>
      loadResponseOrThrow(() => _api.loadPopularDrama());

  /* TMDB - 영화 비디오 정보 (trailerkey, video 제공 플랫폼 정보 등을 담고 있음) */
  @override
  Future<TmdbMovieVideoInfoResponse> loadTmdbMovieVideoInfo(int contentId) =>
      loadResponseOrThrow(() => _api.loadTmdbMovieVideoInfo(contentId));

  /* TMDB - 드라마 크래딧 정보 호출 (출연진 정보 등등) */
  @override
  Future<TmdbDramaCreditResponse> loadTmdbDramaCredit(int dramaId) =>
      loadResponseOrThrow(() => _api.loadDramaCreditInfo(dramaId));

  /* TMDB - 영화 크래딧 정보 호출 (출연진 정보 등등) */
  @override
  Future<TmdbMovieCreditResponse> loadTmdbMovieCredit(int movieId) =>
      loadResponseOrThrow(() => _api.loadMovieCreditInfo(movieId));

  /* TMDB - 영화 상세 정보 호출 */
  @override
  Future<TmdbMovieDetailInfoResponse> loadTmdbMovieDetailInfo(int movieId) =>
      loadResponseOrThrow(() => _api.loadMovieDetailInfo(movieId));

  /* TMDB - 장르키를 바다탕으로 영화 정보 리스트 호출*/
  @override
  Future<TmdbGenreMovieListResponse> loadMovieListByGenre(
          {required int genreId, required int page}) =>
      loadResponseOrThrow(
          () => _api.loadMovieListByGenreResponse(genreId, page));

  /* TMDB - 영화 검색 결과 리스트 호출 */
  @override
  Future<TmdbMovieResponse> loadMovieSearchList(String query) =>
      loadResponseOrThrow(() => _api.loadMovieSearchList(query));
}
