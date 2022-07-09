import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_drama_item_response.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_item_response.dart';

class ContentModel {
  final bool? adult;
  final String? backDropUrl;
  final String? posterUrl;
  final num id;
  final String title;
  final String overview;
  final String releaseDate;
  final num voteAverage;

  ContentModel(
      {required this.adult,
      required this.backDropUrl,
      required this.posterUrl,
      required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage});

  factory ContentModel.fromMovieResponse(TmdbMovieItemResponse response) =>
      ContentModel(
          adult: response.adult,
          id: response.id,
          title: response.title,
          overview: response.overview,
          releaseDate: response.release_date,
          voteAverage: response.vote_average,
          backDropUrl: response.backdrop_path,
          posterUrl: response.poster_path);

  factory ContentModel.fromDramaResponse(TmdbDramaItemResponse response) =>
      ContentModel(
          adult: null,
          id: response.id,
          title: response.name,
          overview: response.overview,
          releaseDate: response.first_air_date,
          voteAverage: response.vote_average,
          backDropUrl: response.backdrop_path,
          posterUrl: response.poster_path);
}
