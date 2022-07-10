import 'package:movie_curation/utilities/index.dart';

class TmdbRemoteDataSourceImpl
    with ApiErrorHandlerMixin
    implements TmdbRemoteDataSource {
  TmdbRemoteDataSourceImpl(this._api);

  final TmdbApi _api;

  @override
  Future<TmdbPopularMovieResponse> loadPopularMovie() =>
      loadResponseOrThrow(() => _api.loadPopularMovie());

  @override
  Future<TmdbPopularDramaResponse> loadPopularDrama() =>
      loadResponseOrThrow(() => _api.loadPopularDrama());

  @override
  Future<TmdbMovieVideoInfoResponse> loadTmdbMovieVideoInfo(int contentId) =>
      loadResponseOrThrow(() => _api.loadTmdbMovieVideoInfo(contentId));

  @override
  Future<TmdbDramaCreditResponse> loadTmdbDramaCredit(int dramaId) =>
      loadResponseOrThrow(() => _api.loadDramaCreditInfo(dramaId));

  @override
  Future<TmdbMovieCreditResponse> loadTmdbMovieCredit(int movieId) =>
      loadResponseOrThrow(() => _api.loadMovieCreditInfo(movieId));
}
