import 'package:movie_curation/data/remote/source/tmdb/tmdb_remote_data_source.dart';
import 'package:movie_curation/data/repository/tmdb/tmdb_repository.dart';
import 'package:movie_curation/domain/models/tmdb/tmdb_drama_content_model.dart';
import 'package:movie_curation/domain/models/tmdb/tmdb_movie_content_model.dart';
import 'package:movie_curation/utilities/result.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  TmdbRepositoryImpl(this._dataSource);

  final TmdbRemoteDataSource _dataSource;

  @override
  Future<Result<List<TmdbMovieContentModel>>> loadPopularMovie() async {
    try {
      final response = await _dataSource.loadPopularMovie().then((value) =>
          value.results.map(TmdbMovieContentModel.fromResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<List<TmdbDramaContentModel>>> loadPopularDrama() async {
    try {
      final response = await _dataSource.loadPopularDrama().then((value) =>
          value.results.map(TmdbDramaContentModel.fromResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
