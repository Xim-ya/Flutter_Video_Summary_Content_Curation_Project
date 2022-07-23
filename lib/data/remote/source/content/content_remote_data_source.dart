import 'package:movie_curation/data/remote/network/api/content/response/content_recommended_info_response.dart';

abstract class ContentRemoteDataSource {
  /* Content - 등록된(추천) 컨텐츠 정보 호출 */
  Future<List<ContentRecommendedInfoResponse>> loadRecommendedContentInfo();
}
