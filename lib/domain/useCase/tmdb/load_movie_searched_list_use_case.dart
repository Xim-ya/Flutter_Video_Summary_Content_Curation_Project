import 'package:movie_curation/utilities/index.dart';

class LoadMovieSearchedListUseCase
    extends BaseUseCase<String, Result<List<ContentModel>>> {
  LoadMovieSearchedListUseCase(this._repository);
  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentModel>>> call(String request) =>
      _repository.loadMovieSearchList(request);
}
