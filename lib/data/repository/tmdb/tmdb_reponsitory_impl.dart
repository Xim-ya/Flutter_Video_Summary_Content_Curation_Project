import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_drama_item_response.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_item_response.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_drama_response.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_movie_responsee.dart';
import 'package:movie_curation/data/remote/source/tmdb/tmdb_remote_data_source.dart';
import 'package:movie_curation/data/repository/tmdb/tmdb_repository.dart';
import 'package:movie_curation/domain/models/tmdb/tmdb_movie_content_model.dart';
import 'package:movie_curation/utilities/result.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  TmdbRepositoryImpl(this._dataSource);

  final TmdbRemoteDataSource _dataSource;

  @override
  Future<Result<List<TmdbDramaItemResponse>>> loadPopularDrama() {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<TmdbContentModel>>> loadPopularMovie() async {
    try {
      final response = await _dataSource.loadPopularMovie().then(
          (value) => value.results.map(TmdbContentModel.fromResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
