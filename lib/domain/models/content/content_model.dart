import 'package:movie_curation/utilities/index.dart';

class ContentModel {
  final bool? adult;
  final String? backDropUrl;
  final String? posterUrl;
  final num id;
  final String title;
  final String? overview;
  final String? releaseDate;
  final num voteAverage;
  final List<int>? genreIds;
  final List<String>? youtubeVideoIds; // custom

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

  /* API 별로 Factory 패턴을 다르게 함.*/
  // TMDB 인기 영화 API
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

  // TMDB 인기 드라마 API
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

  // TMDB 인기 드라마 API
  factory ContentModel.fromGenreMovieListResponse(
          TmdbMovieGenreItemResponse response) =>
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

  // TMDB 영화 상세정보 API
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

  // TMDB 영화 검색 정보 API
  factory ContentModel.fromMovieSearchListResponse(
          TmdbMovieItemResponse response) =>
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
}
