import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_detail_info_response.dart';
import 'package:movie_curation/domain/models/tmdb/tmdb_movie_detail_info_model.dart';
import 'package:movie_curation/utilities/index.dart';

class ContentModel {
  final bool? adult;
  final String? backDropUrl;
  final String? posterUrl;
  final num id;
  final String title;
  final String? overview;
  final String releaseDate;
  final num voteAverage;
  final List<int>? genreIds;
  final List<String>? youtubeVideoIds;

  ContentModel({
    required this.adult,
    required this.backDropUrl,
    required this.posterUrl,
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.genreIds,
    required this.youtubeVideoIds,
  });

  factory ContentModel.fromMovieResponse(TmdbMovieItemResponse response) =>
      ContentModel(
        adult: response.adult,
        id: response.id,
        title: response.title,
        overview: response.overview,
        releaseDate: response.release_date,
        voteAverage: response.vote_average,
        backDropUrl: response.backdrop_path,
        posterUrl: response.poster_path,
        genreIds: response.genre_ids,
        youtubeVideoIds: null,
      );

  factory ContentModel.fromDramaResponse(TmdbDramaItemResponse response) =>
      ContentModel(
        adult: null,
        id: response.id,
        title: response.name,
        overview: response.overview,
        releaseDate: response.first_air_date,
        voteAverage: response.vote_average,
        backDropUrl: response.backdrop_path,
        posterUrl: response.poster_path,
        genreIds: response.genre_ids,
        youtubeVideoIds: null,
      );

  factory ContentModel.fromMovieDetailInfoResponse(
      TmdbMovieDetailInfoResponse response, List<String> youtubeIdList) {
    List<int>? genreIdList = response.genres
        ?.map((e) => TmdbMovieDetailGenreModel.fromResponse(e).id)
        .toList();

    return ContentModel(
      adult: response.adult,
      backDropUrl: response.backdrop_path,
      posterUrl: response.poster_path,
      id: response.id,
      title: response.title,
      overview: response.overview,
      releaseDate: response.release_date,
      voteAverage: response.vote_average,
      genreIds: genreIdList,
      youtubeVideoIds: youtubeIdList,
    );
  }
}
