import 'package:movie_curation/utilities/index.dart';

abstract class TmdbRepository {
  Future<Result<List<ContentModel>>> loadPopularMovie();
  Future<Result<List<ContentModel>>> loadPopularDrama();
  Future<Result<List<TmdbMovieVideoInfoModel>>> loadMovieVideoInfo(int movieId);
  Future<Result<List<ContentCastModel>>> loadMovieCastInfo(int movieId);
  Future<Result<List<ContentCastModel>>> loadDramaCastInfo(int dramaId);
  Future<Result<ContentModel>> loadMovieDetailInfo(int movieId);
  Future<Result<List<ContentModel>>> loadMovieListByGenre(
      {required int genreId, required int page});
  Future<Result<List<ContentModel>>> loadMovieSearchList(String query);
  Future<Result<List<ContentModel>>> loadSimilarMovieList(int movieId);
}
