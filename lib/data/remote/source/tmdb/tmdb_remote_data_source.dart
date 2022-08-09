import 'package:movie_curation/utilities/index.dart';

abstract class TmdbRemoteDataSource {
  Future<TmdbMovieResponse> loadPopularMovie();
  Future<TmdbPopularDramaResponse> loadPopularDrama();
  Future<TmdbMovieVideoInfoResponse> loadTmdbMovieVideoInfo(int movieId);
  Future<TmdbMovieCreditResponse> loadTmdbMovieCredit(int movieId);
  Future<TmdbDramaCreditResponse> loadTmdbDramaCredit(int dramaId);
  Future<TmdbMovieDetailInfoResponse> loadTmdbMovieDetailInfo(int movieId);
  Future<TmdbGenreMovieListResponse> loadMovieListByGenre(
      {required int genreId, required int page});
  Future<TmdbMovieResponse> loadMovieSearchList(String query);
  Future<TmdbMovieResponse> loadSimilarMovieList(int movieId);
}
