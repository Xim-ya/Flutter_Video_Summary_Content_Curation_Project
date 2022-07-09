import 'package:movie_curation/domain/models/content/content_model.dart';
import 'package:movie_curation/domain/models/tmdb/tmdbMovieVideoInfoModel.dart';
import 'package:movie_curation/utilities/result.dart';

abstract class TmdbRepository {
  /* TMDB - 인기 영화 리스트 */
  Future<Result<List<ContentModel>>> loadPopularMovie();

  /* TMDB - 인기 드라마 리스트 */
  Future<Result<List<ContentModel>>> loadPopularDrama();

  /* TMDB - 영화 비디오 정보 */
  Future<Result<List<TmdbMovieVideoInfoModel>>> loadMovieVideoInfo(
      int contentId);
}
