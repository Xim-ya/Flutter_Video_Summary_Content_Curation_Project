import 'package:movie_curation/utilities/index.dart';

class LoadMovieListByGenreUseCase
    extends BaseUseCase<int, Result<List<ContentModel>>> {
  LoadMovieListByGenreUseCase(this._repository);
  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentModel>>> call(int request) {
    return _repository.loadMovieListByGenre(request);
  }
}
