import 'package:movie_curation/utilities/index.dart';

class ContentRepositoryImpl implements ContentRepository {
  ContentRepositoryImpl(
      this._contentDataSource, this._repository, this._tmdbRemoteDataSource);
  final ContentRemoteDataSource _contentDataSource;
  final TmdbRemoteDataSource _tmdbRemoteDataSource;
  final TmdbRepository _repository;

  /* 추천 컨텐츠 리스트 호출 */
  // TMDB API 데이터 매핑.
  @override
  Future<Result<List<ContentModel>>> loadRecommendedContentInfo() async {
    List<ContentModel> recommendedContents = [];
    List<ContentRecommendedInfoResponse> recommendedContentInfoList =
        await _contentDataSource.loadRecommendedContentInfo();
    try {
      for (ContentRecommendedInfoResponse content
          in recommendedContentInfoList) {
        recommendedContents.add(await _tmdbRemoteDataSource
                .loadTmdbMovieDetailInfo(content.contentId)
                .then((value) => ContentModel.fromMovieDetailInfoResponse(
                    value, content.youtubeVideoIdList))

            // await _repository.loadMovieDetailInfo(content.contentId).then(
            //   (value) {
            //     return ContentModel.fromMovieDetailInfoResponse(
            //         value, content.youtubeVideoIdList);
            //   },
            // ),
            );
      }
      return Result.success(recommendedContents);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  /* 등록된 컨텐츠 아이디 리스트 호출 */
  @override
  Future<Result<List<ContentRegisteredIdInfoModel>>>
      loadRegisteredIdList() async {
    try {
      final response = await _contentDataSource.loadRegisteredIdList().then(
          (value) =>
              value.map(ContentRegisteredIdInfoModel.fromResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  /* 특정 컨텐츠의 유튜브 비디오 url 리스트 호출 */
  @override
  Future<Result<List<String>>> loadRegisteredContentYoutubeIdList(
      {required String documentPath, required int contentId}) async {
    try {
      final response =
          await _contentDataSource.loadRegisteredContentYoutubeIdList(
              documentPath: documentPath, contentId: contentId);
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
