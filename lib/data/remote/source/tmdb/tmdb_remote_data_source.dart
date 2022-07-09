import 'package:movie_curation/utilities/index.dart';

abstract class TmdbRemoteDataSource {
  /* TMDB - 인기 영화 호출 */
  Future<TmdbPopularMovieResponse> loadPopularMovie();

  /* TMDB - 인기 드라마 호출 */
  Future<TmdbPopularDramaResponse> loadPopularDrama();

  /* TMDB - 영화 비디오 정보 (trailerkey, video 제공 플랫폼 정보 등을 담고 있음) */
  Future<TmdbMovieVideoInfoResponse> loadTmdbMovieVideoInfo(int contentId);
}
