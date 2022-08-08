import 'package:movie_curation/utilities/index.dart';

class LoadSimilarMovieListUseCase
    extends BaseUseCase<int, Result<List<ContentModel>>> {
  LoadSimilarMovieListUseCase(this._repository);
  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentModel>>> call(int request) async =>
      _repository.loadSimilarMovieList(request);
}
