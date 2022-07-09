import 'package:movie_curation/data/repository/tmdb/tmdb_repository.dart';
import 'package:movie_curation/domain/base/base_no_param_use_case.dart';
import 'package:movie_curation/domain/models/content/content_model.dart';
import 'package:movie_curation/utilities/result.dart';

class LoadPopularMoviesUseCase extends BaseNoParamUseCase {
  LoadPopularMoviesUseCase(this._repository);

  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentModel>>> call() {
    return _repository.loadPopularMovie();
  }
}
