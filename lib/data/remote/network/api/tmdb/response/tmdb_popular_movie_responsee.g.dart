// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_popular_movie_responsee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TmdbPopularMovieResponse _$TmdbPopularMovieResponseFromJson(
        Map<String, dynamic> json) =>
    TmdbPopularMovieResponse(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => TmdbMovieItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
