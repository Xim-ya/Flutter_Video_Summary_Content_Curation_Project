import 'package:movie_curation/utilities/index.dart';

/* 2022.07.16 Created by Ximya
   인기 영화 드라마 컨텐츠 리스트 호출을 담당하는 UseCase
   현재 controller에서 선택된 `카테고리 인덱스`를 기준으로 컨텐츠를 호출
*/

class LoadPopularContentListUseCase
    extends BaseUseCase<int, Result<List<ContentModel>>> {
  LoadPopularContentListUseCase(this._tmdbRepository, this._contentRepository);
  final TmdbRepository _tmdbRepository;
  final ContentRepository _contentRepository;

  @override
  Future<Result<List<ContentModel>>> call(request) async {
    if (request == 0) {
      // Firebase > Content - 추천 컨텐츠 리스트
      return _contentRepository.loadRecommendedContentInfo();
    } else if (request == 1) {
      // TMDB > 인기 영화 리스트
      return _tmdbRepository.loadPopularMovie();
    } else {
      // TMDB > 인기 드라 리스트
      return _tmdbRepository.loadPopularDrama();
    }
  }
}
