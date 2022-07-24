import 'package:movie_curation/utilities/index.dart';

abstract class ContentRemoteDataSource {
  /* Content - 등록된(추천) 컨텐츠 정보 호출 */
  Future<List<ContentRecommendedInfoResponse>> loadRecommendedContentInfo();
}
