import 'package:movie_curation/utilities/index.dart';

abstract class ContentRemoteDataSource {
  Future<List<ContentRecommendedInfoResponse>> loadRecommendedContentInfo();
  Future<List<ContentRegisteredIdInfoItemResponse>> loadRegisteredIdList();
  Future<List<String>> loadRegisteredContentYoutubeIdList(
      {required String documentPath, required int contentId});
}
