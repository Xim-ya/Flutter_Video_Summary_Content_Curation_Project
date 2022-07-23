import 'package:movie_curation/domain/models/content/content_model.dart';
import 'package:movie_curation/utilities/result.dart';

abstract class ContentRepository {
  Future<Result<List<ContentModel>>> loadRecommendedContentInfo();
}
