import 'package:movie_curation/utilities/index.dart';

abstract class TmdbRepository {
  /* TMDB - 인기 영화 리스트 */
  Future<Result<List<ContentModel>>> loadPopularMovie();

  /* TMDB - 인기 드라마 리스트 */
  Future<Result<List<ContentModel>>> loadPopularDrama();

  /* TMDB - 영화 비디오 정보 */
  Future<Result<List<TmdbMovieVideoInfoModel>>> loadMovieVideoInfo(
      int contentId);
}
