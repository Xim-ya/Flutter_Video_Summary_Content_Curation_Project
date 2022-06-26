import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_item_response.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_movie_responsee.dart';

class TmdbMovieContentParentModel {
  final int page;
  final List<TmdbMovieContentModel> results;

  TmdbMovieContentParentModel({required this.results, required this.page});

  factory TmdbMovieContentParentModel.fromResponse(
      TmdbPopularMovieResponse response) {
    List<TmdbMovieContentModel> result = (response.results)
        .map((e) => TmdbMovieContentModel.fromResponse(e))
        .toList();
    return TmdbMovieContentParentModel(results: result, page: response.page);
  }
}

class TmdbMovieContentModel {
  final bool adult;
  final String? backDropUrl;
  final String? posterUrl;
  final num id;
  final String title;
  final String overview;
  final String releaseDate;
  final num voteAverage;

  TmdbMovieContentModel(
      {required this.adult,
      this.backDropUrl,
      this.posterUrl,
      required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage});

  factory TmdbMovieContentModel.fromResponse(TmdbMovieItemResponse response) =>
      TmdbMovieContentModel(
          adult: response.adult,
          id: response.id,
          title: response.title,
          overview: response.overview,
          releaseDate: response.release_date,
          voteAverage: response.vote_average);
}
