import 'package:movie_curation/utilities/index.dart';

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

  @override
  Future<Result<List<ContentCastModel>>> loadDramaCastInfo(int dramaId) async {
    try {
      final response = await _dataSource.loadTmdbMovieCredit(dramaId).then(
          (value) =>
              value.cast.map(ContentCastModel.fromDramaResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<List<ContentCastModel>>> loadMovieCastInfo(int movieId) async {
    try {
      final response = await _dataSource.loadTmdbMovieCredit(movieId).then(
          (value) =>
              value.cast.map(ContentCastModel.fromMovieResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<TmdbMovieDetailInfoResponse> loadMovieDetailInfo(int movieId) {
    return _dataSource.loadTmdbMovieDetailInfo(movieId);
  }

// @override
// Future<Result<ContentModel>> loadMovieDetailInfo(int movieId) async {
//   try {
//     final response = await _dataSource
//         .loadTmdbMovieDetailInfo(movieId)
//         .then(ContentModel.fromMovieDetailInfoResponse);
//     return Result.success(response);
//   } on Exception catch (e) {
//     return Result.failure(e);
//   }
// }
}
