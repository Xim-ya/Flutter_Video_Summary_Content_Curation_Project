import 'package:movie_curation/utilities/index.dart';

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
