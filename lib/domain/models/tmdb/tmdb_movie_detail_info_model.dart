import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_detail_info_response.dart';

class TmdbMovieDetailInfoModel {
  final bool? adult;
  final String? backDropUrl;
  final String? posterUrl;
  final num id;
  final String title;
  final String? overview;
  final String releaseDate;
  final num voteAverage;
  final List<int>? genreIds;

  TmdbMovieDetailInfoModel(
      {required this.adult,
      required this.backDropUrl,
      required this.posterUrl,
      required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage,
      required this.genreIds});

  factory TmdbMovieDetailInfoModel.fromResponse(
      TmdbMovieDetailInfoResponse response) {
    List<int>? genreIdList = response.genres
        ?.map((e) => TmdbMovieDetailGenreModel.fromResponse(e).id)
        .toList();

    return TmdbMovieDetailInfoModel(
        adult: response.adult,
        backDropUrl: response.backdrop_path,
        posterUrl: response.poster_path,
        id: response.id,
        title: response.title,
        overview: response.overview,
        releaseDate: response.release_date,
        voteAverage: response.vote_average,
        genreIds: genreIdList);
  }
}

class TmdbMovieDetailGenreModel {
  final int id;
  final String name;

  TmdbMovieDetailGenreModel({required this.id, required this.name});

  factory TmdbMovieDetailGenreModel.fromResponse(MovieGenreResponse response) {
    return TmdbMovieDetailGenreModel(id: response.id, name: response.name);
  }
}
