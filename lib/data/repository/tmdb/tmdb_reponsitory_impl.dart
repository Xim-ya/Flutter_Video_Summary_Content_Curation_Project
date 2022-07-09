import 'package:movie_curation/data/remote/source/tmdb/tmdb_remote_data_source.dart';
import 'package:movie_curation/data/repository/tmdb/tmdb_repository.dart';
import 'package:movie_curation/domain/models/content/content_model.dart';
import 'package:movie_curation/domain/models/tmdb/tmdbMovieVideoInfoModel.dart';
import 'package:movie_curation/utilities/result.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  TmdbRepositoryImpl(this._dataSource);

  final TmdbRemoteDataSource _dataSource;

  @override
  Future<Result<List<ContentModel>>> loadPopularMovie() async {
    try {
      final response = await _dataSource.loadPopularMovie().then((value) =>
          value.results.map(ContentModel.fromMovieResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<List<ContentModel>>> loadPopularDrama() async {
    try {
      final response = await _dataSource.loadPopularDrama().then((value) =>
          value.results.map(ContentModel.fromDramaResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  // @override
  // Future<List<TmdbMovieVideoInfoModel>> loadMovieVideoInfo(int contentId) {
  //   final response = _dataSource.loadTmdbMovieVideoInfo(contentId).then(
  //       (value) =>
  //           value.results.map(TmdbMovieVideoInfoModel.fromResponse).toList());
  //   return response;
  // }

  // @override
  // Future<List<TmdbMovieVideoInfoModel>> loadMovieVideoInfo(int contentId) {
  //     try {
  //       final response = _dataSource.loadTmdbMovieVideoInfo(contentId).then(
  //           (value) =>
  //               value.results.map(TmdbMovieVideoInfoModel.fromResponse).toList());
  //       return response;
  //     } on Exception catch (e) {
  //       print(e);
  //     }
  // }

  @override
  Future<Result<List<TmdbMovieVideoInfoModel>>> loadMovieVideoInfo(
      contentId) async {
    try {
      final response = await _dataSource.loadTmdbMovieVideoInfo(contentId).then(
          (value) =>
              value.results.map(TmdbMovieVideoInfoModel.fromResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
