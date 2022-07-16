import 'package:movie_curation/utilities/index.dart';

class TmdbLoadMovieCastsUseCase
    extends BaseUseCase<int, Result<List<ContentCastModel>>> {
  TmdbLoadMovieCastsUseCase(this._repository);

  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentCastModel>>> call(int request) {
    return _repository.loadMovieCastInfo(request);
  }
}
