import 'package:movie_curation/domain/models/tmdb/tmdb_drama_content_model.dart';
import 'package:movie_curation/domain/models/tmdb/tmdb_movie_content_model.dart';
import 'package:movie_curation/utilities/result.dart';

abstract class TmdbRepository {
  /* TMDB - 인기 영화 리스트 */
  Future<Result<List<TmdbMovieContentModel>>> loadPopularMovie();

  /* TMDB - 인기 드라마 리스트 */
  Future<Result<List<TmdbDramaContentModel>>> loadPopularDrama();
}
