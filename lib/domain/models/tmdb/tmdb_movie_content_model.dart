import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_item_response.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_movie_responsee.dart';
import 'package:movie_curation/domain/models/content/content_model.dart';

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
