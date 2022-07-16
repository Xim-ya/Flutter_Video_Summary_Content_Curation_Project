import 'package:movie_curation/utilities/index.dart';

class TmdbLoadDramaCastsUseCase
    extends BaseUseCase<int, Result<List<ContentCastModel>>> {
  TmdbLoadDramaCastsUseCase(this._repository);

  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentCastModel>>> call(int request) {
    return _repository.loadDramaCastInfo(request);
  }
}
