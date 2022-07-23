import 'package:movie_curation/data/repository/content/content_repository.dart';
import 'package:movie_curation/domain/useCase/tmdb/tmdb_load_movie_detail_info_use_case.dart';
import 'package:movie_curation/utilities/data/firebase_temp_data.dart';
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
      // TMDB > 인기 영화 리스트
      return _tmdbRepository.loadPopularMovie();
    } else if (request == 1) {
      // TMDB > 인기 드라 리스트
      return _tmdbRepository.loadPopularDrama();
    } else {
      return _contentRepository.loadRecommendedContentInfo();

      // // 추천 영화&드라마 리스트
      // List<ContentModel> registeredContents = [];
      // List<RegisteredContent> registeredList = FirebaseTemp.registerContentList;
      // try {
      //   for (RegisteredContent content in registeredList) {
      //     registeredContents.add(
      //       await _repository.loadMovieDetailInfo(content.contentId).then(
      //         (value) {
      //           return ContentModel.fromMovieDetailInfoResponse(
      //               value, content.youtubeVideIdList);
      //         },
      //       ),
      //     );
      //   }
      //   return Result.success(registeredContents);
      // } on Exception catch (e) {
      //   return Result.failure(e);
      // }
    }
  }
}
