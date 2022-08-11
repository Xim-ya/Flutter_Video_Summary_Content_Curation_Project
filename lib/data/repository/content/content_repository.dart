import 'package:movie_curation/domain/models/content/content_registered_id_info_model.dart';
import 'package:movie_curation/utilities/index.dart';

abstract class ContentRepository {
  Future<Result<List<ContentModel>>> loadRecommendedContentInfo();
  Future<Result<List<ContentRegisteredIdInfoModel>>> loadRegisteredIdList();
}
