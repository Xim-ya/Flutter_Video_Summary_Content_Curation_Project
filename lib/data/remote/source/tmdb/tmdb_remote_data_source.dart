import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_drama_response.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_movie_responsee.dart';

abstract class TmdbRemoteDataSource {
  /* TMDB - 인기 영화 호출 */
  Future<TmdbPopularMovieResponse> loadPopularMovie();

  /* TMDB - 인기 드라마 호출 */
  Future<TmdbPopularDramaResponse> loadPopularDrama();
}
