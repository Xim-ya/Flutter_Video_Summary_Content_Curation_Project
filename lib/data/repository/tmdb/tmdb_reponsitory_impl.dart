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
}
