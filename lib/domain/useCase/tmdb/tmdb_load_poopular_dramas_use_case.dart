import 'package:movie_curation/utilities/index.dart';

class TmdbLoadPopularDramasUseCase extends BaseNoParamUseCase {
  TmdbLoadPopularDramasUseCase(this._repository);
  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentModel>>> call() {
    return _repository.loadPopularDrama();
  }
}
