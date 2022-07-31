import 'package:movie_curation/utilities/index.dart';

class LoadMovieListByGenreUseCase
    extends BaseUseCase<int, Result<List<ContentModel>>> {
  LoadMovieListByGenreUseCase(this._tmdbRepository, this._contentRepository);
  final TmdbRepository _tmdbRepository;
  final ContentRepository _contentRepository;

  @override
  Future<Result<List<ContentModel>>> call(int request) {
    print(" aim --> ${request}");
    if (request == 3210) {
      return _contentRepository.loadRecommendedContentInfo();
    } else {
      return _tmdbRepository.loadMovieListByGenre(request);
    }
  }
}
