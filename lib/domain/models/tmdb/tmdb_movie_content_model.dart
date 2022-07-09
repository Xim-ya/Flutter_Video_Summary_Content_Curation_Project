import 'package:movie_curation/utilities/index.dart';

class TmdbMovieContentParentModel {
  final int page;
  final List<ContentModel> results;

  TmdbMovieContentParentModel({required this.results, required this.page});

  factory TmdbMovieContentParentModel.fromResponse(
      TmdbPopularMovieResponse response) {
    List<ContentModel> result = (response.results)
        .map((e) => ContentModel.fromMovieResponse(e))
        .toList();
    return TmdbMovieContentParentModel(results: result, page: response.page);
  }
}
