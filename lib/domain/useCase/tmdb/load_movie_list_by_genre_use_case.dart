import 'package:movie_curation/domain/base/base_two_param_use_case.dart';
import 'package:movie_curation/utilities/index.dart';

class LoadMovieListByGenreUseCase
    extends BaseTwoParamUseCase<int, int, Result<List<ContentModel>>> {
  LoadMovieListByGenreUseCase(this._tmdbRepository, this._contentRepository);
  final TmdbRepository _tmdbRepository;
  final ContentRepository _contentRepository;

  @override
  Future<Result<List<ContentModel>>> call(int firstReq, int secondReq) {
    if (firstReq == 3210) {
      return _contentRepository.loadRecommendedContentInfo();
    } else {
      return _tmdbRepository.loadMovieListByGenre(
          genreId: firstReq, page: secondReq);
    }
  }
}
