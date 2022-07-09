import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_video_info.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_drama_response.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_movie_responsee.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/tmdb_api.dart';
import 'package:movie_curation/data/remote/source/tmdb/tmdb_remote_data_source.dart';
import 'package:movie_curation/utilities/mixin/api_error_handler_mixin.dart';

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
}
