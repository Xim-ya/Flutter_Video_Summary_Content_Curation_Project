import 'package:movie_curation/utilities/index.dart';

abstract class ContentRepository {
  Future<Result<List<ContentModel>>> loadRecommendedContentInfo();
  Future<Result<List<ContentRegisteredIdInfoModel>>> loadRegisteredIdList();
  Future<Result<List<String>>> loadRegisteredContentYoutubeIdList(
      {required String documentPath, required int contentId});
}
