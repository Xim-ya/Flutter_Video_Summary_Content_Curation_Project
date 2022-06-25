import 'package:json_annotation/json_annotation.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_item_response.dart';

part 'tmdb_popular_movie_responsee.g.dart';

@JsonSerializable(createToJson: false)
class TmdbPopularMovieResponse {
  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'results')
  List<TmdbMovieItemResponse> results;

  TmdbPopularMovieResponse(this.page, this.results);

  factory TmdbPopularMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$TmdbPopularMovieResponseFromJson(json);
}
