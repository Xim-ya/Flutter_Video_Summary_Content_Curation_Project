import 'package:movie_curation/utilities/index.dart';

abstract class ContentRemoteDataSource {
  Future<List<ContentRecommendedInfoResponse>> loadRecommendedContentInfo();
  Future<List<int>> loadRegisteredIdList();
}
