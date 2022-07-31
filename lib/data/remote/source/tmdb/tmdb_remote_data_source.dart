import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_genre_movie_list_response.dart';
import 'package:movie_curation/utilities/index.dart';

abstract class TmdbRemoteDataSource {
  Future<TmdbMovieResponse> loadPopularMovie();
  Future<TmdbPopularDramaResponse> loadPopularDrama();
  Future<TmdbMovieVideoInfoResponse> loadTmdbMovieVideoInfo(int movieId);
  Future<TmdbMovieCreditResponse> loadTmdbMovieCredit(int movieId);
  Future<TmdbDramaCreditResponse> loadTmdbDramaCredit(int dramaId);
  Future<TmdbMovieDetailInfoResponse> loadTmdbMovieDetailInfo(int movieId);
  Future<TmdbGenreMovieListResponse> loadMovieListByGenre(int genreId);
}
