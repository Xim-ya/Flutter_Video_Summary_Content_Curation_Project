import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_drama_item_response.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_drama_response.dart';

class TmdbDramaContentParentModel {
  final int page;
  final List<TmdbDramaContentModel> results;

  TmdbDramaContentParentModel({required this.results, required this.page});

  factory TmdbDramaContentParentModel.fromResponse(
      TmdbPopularDramaResponse response) {
    List<TmdbDramaContentModel> result = (response.results)
        .map((e) => TmdbDramaContentModel.fromResponse(e))
        .toList();
    return TmdbDramaContentParentModel(results: result, page: response.page);
  }
}

class TmdbDramaContentModel {
  final bool? adult;
  final String? backDropUrl;
  final String? posterUrl;
  final num id;
  final String title;
  final String overview;
  final String? releaseDate;
  final num voteAverage;

  TmdbDramaContentModel(
      {required this.adult,
      this.backDropUrl,
      this.posterUrl,
      required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage});

  factory TmdbDramaContentModel.fromResponse(TmdbDramaItemResponse response) =>
      TmdbDramaContentModel(
          adult: null,
          id: response.id,
          title: response.name,
          overview: response.overview,
          releaseDate: null,
          voteAverage: response.vote_average);
}
