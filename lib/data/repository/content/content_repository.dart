import 'package:movie_curation/utilities/index.dart';

abstract class ContentRepository {
  Future<Result<List<ContentModel>>> loadRecommendedContentInfo();
}
