import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_detail_info_response.dart';
import 'package:movie_curation/utilities/index.dart';

abstract class TmdbRemoteDataSource {
  /* TMDB - 인기 영화 호출 */
  Future<TmdbPopularMovieResponse> loadPopularMovie();

  /* TMDB - 인기 드라마 호출 */
  Future<TmdbPopularDramaResponse> loadPopularDrama();

  /* TMDB - 영화 비디오 정보 (trailerkey, video 제공 플랫폼 정보 등을 담고 있음) */
  Future<TmdbMovieVideoInfoResponse> loadTmdbMovieVideoInfo(int movieId);

  /* TMDB - 영화 크래딧 정보 호출 (출연진 정보 등등) */
  Future<TmdbMovieCreditResponse> loadTmdbMovieCredit(int movieId);

  /* TMDB - 드라마 크래딧 정보 호출 (출연진 정보 등등) */
  Future<TmdbDramaCreditResponse> loadTmdbDramaCredit(int dramaId);

  /* TMDB - 영화 상세 정보 호출 */
  Future<TmdbMovieDetailInfoResponse> loadTmdbMovieDetailInfo(int movieId);
}
