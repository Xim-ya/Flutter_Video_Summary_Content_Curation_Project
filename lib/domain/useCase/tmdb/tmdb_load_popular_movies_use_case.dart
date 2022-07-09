import 'package:movie_curation/utilities/index.dart';

class LoadPopularMoviesUseCase extends BaseNoParamUseCase {
  LoadPopularMoviesUseCase(this._repository);

  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentModel>>> call() {
    return _repository.loadPopularMovie();
  }
}
