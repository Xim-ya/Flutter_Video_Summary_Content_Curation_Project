import 'package:movie_curation/utilities/index.dart';

part 'tmdb_popular_movie_responsee.g.dart';

@JsonSerializable(createToJson: false)
class TmdbMovieResponse {
  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'results')
  List<TmdbMovieItemResponse> results;

  TmdbMovieResponse(this.page, this.results);

  factory TmdbMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$TmdbPopularMovieResponseFromJson(json);
}
