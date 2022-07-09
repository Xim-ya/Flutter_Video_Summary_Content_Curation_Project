import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_drama_response.dart';
import 'package:movie_curation/domain/models/content/content_model.dart';

class TmdbDramaContentParentModel {
  final int page;
  final List<ContentModel> results;

  TmdbDramaContentParentModel({required this.results, required this.page});

  factory TmdbDramaContentParentModel.fromResponse(
      TmdbPopularDramaResponse response) {
    List<ContentModel> result = (response.results)
        .map((e) => ContentModel.fromDramaResponse(e))
        .toList();
    return TmdbDramaContentParentModel(results: result, page: response.page);
  }
}
