import 'package:movie_curation/utilities/index.dart';

class ContentRepositoryImpl implements ContentRepository {
  ContentRepositoryImpl(this._dataSource, this._repository);
  final ContentRemoteDataSource _dataSource;
  final TmdbRepository _repository;

  /* 추천 컨텐츠 리스트 호출 */
  // TMDB API 데이터 매핑.
  @override
  Future<Result<List<ContentModel>>> loadRecommendedContentInfo() async {
    List<ContentModel> recommendedContents = [];
    List<ContentRecommendedInfoResponse> recommendedContentInfoList =
        await _dataSource.loadRecommendedContentInfo();
    try {
      for (ContentRecommendedInfoResponse content
          in recommendedContentInfoList) {
        recommendedContents.add(
          await _repository.loadMovieDetailInfo(content.contentId).then(
            (value) {
              return ContentModel.fromMovieDetailInfoResponse(
                  value, content.youtubeVideoIdList);
            },
          ),
        );
      }
      return Result.success(recommendedContents);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  /* 등록된 컨텐츠 아이디 리스트 호출 */
  @override
  Future<Result<List<int>>> loadRegisteredIdList() async {
    try {
      final response = await _dataSource.loadRegisteredIdList();
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
