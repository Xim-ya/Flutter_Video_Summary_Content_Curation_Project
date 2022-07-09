import 'package:movie_curation/utilities/index.dart';

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
