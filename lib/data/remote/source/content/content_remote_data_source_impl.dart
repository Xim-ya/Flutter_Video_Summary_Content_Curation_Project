import 'package:movie_curation/utilities/index.dart';

class ContentRemoteDataSourceImpl
    with ApiErrorHandlerMixin
    implements ContentRemoteDataSource {
  ContentRemoteDataSourceImpl(this._api);
  final ContentApi _api;

  /* Content - 추천 컨텐츠 리스트 호출 */
  @override
  Future<List<ContentRecommendedInfoResponse>> loadRecommendedContentInfo() =>
      loadResponseOrThrow(() => _api.loadRecommendedContentInfo());

  /* Content - 등록된 컨텐츠 ID 리스트 호출*/
  @override
  Future<List<ContentRegisteredIdInfoItemResponse>> loadRegisteredIdList() =>
      loadResponseOrThrow(() => _api.loadRegisteredIdList());

  /* Content - 특정 컨텐츠의 yotube video id list 정보 호출
     [document path]와 [content id] 값으로 조회
   */
  @override
  Future<List<String>> loadRegisteredContentYoutubeIdList(
          {required String documentPath, required int contentId}) =>
      loadResponseOrThrow(() =>
          _api.loadRegisteredContentYoutubeIdList(documentPath, contentId));
}
