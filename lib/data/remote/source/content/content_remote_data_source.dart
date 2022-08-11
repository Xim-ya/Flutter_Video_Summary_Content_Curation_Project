import 'package:movie_curation/data/remote/network/api/content/response/content_registered_id_info_item_response.dart';
import 'package:movie_curation/utilities/index.dart';

abstract class ContentRemoteDataSource {
  Future<List<ContentRecommendedInfoResponse>> loadRecommendedContentInfo();
  Future<List<ContentRegisteredIdInfoItemResponse>> loadRegisteredIdList();
}
