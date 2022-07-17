import 'package:movie_curation/domain/models/tmdb/tmdb_movie_detail_info_model.dart';
import 'package:movie_curation/utilities/index.dart';

class TmdbLoadMovieDetailInfoUseCase
    extends BaseUseCase<int, Result<TmdbMovieDetailInfoModel>> {
  TmdbLoadMovieDetailInfoUseCase(this._repository);

  final TmdbRepository _repository;

  @override
  Future<Result<TmdbMovieDetailInfoModel>> call(int request) {
    return _repository.loadMovieDetailInfo(request);
  }
}
