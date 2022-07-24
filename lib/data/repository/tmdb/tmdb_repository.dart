import 'package:movie_curation/utilities/index.dart';

abstract class TmdbRepository {
  /* TMDB - 인기 영화 리스트 */
  Future<Result<List<ContentModel>>> loadPopularMovie();

  /* TMDB - 인기 드라마 리스트 */
  Future<Result<List<ContentModel>>> loadPopularDrama();

  /* TMDB - 영화 비디오 정보 */
  Future<Result<List<TmdbMovieVideoInfoModel>>> loadMovieVideoInfo(int movieId);

  /* TMDB - 영화 크래딧 리스트 */
  Future<Result<List<ContentCastModel>>> loadMovieCastInfo(int movieId);

  /* TMDB - 드라마 크래딧 리스트 */
  Future<Result<List<ContentCastModel>>> loadDramaCastInfo(int dramaId);

  /* TMDB - 영화 상세 정보 */
  Future<TmdbMovieDetailInfoResponse> loadMovieDetailInfo(int movieId);
}
