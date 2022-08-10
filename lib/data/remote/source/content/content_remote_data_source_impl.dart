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
  Future<List<int>> loadRegisteredIdList() =>
      loadResponseOrThrow(() => _api.loadRegisteredIdList());
}
