import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_drama_item_response.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_item_response.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_drama_response.dart';
import 'package:movie_curation/domain/models/tmdb/tmdb_movie_content_model.dart';
import 'package:movie_curation/utilities/result.dart';

abstract class TmdbRepository {
  /* TMDB - 인기 영화 리스트 */
  Future<Result<List<TmdbContentModel>>> loadPopularMovie();

  /* TMDB - 인기 드라마 리스트 */
  Future<Result<List<TmdbDramaItemResponse>>> loadPopularDrama();
}
