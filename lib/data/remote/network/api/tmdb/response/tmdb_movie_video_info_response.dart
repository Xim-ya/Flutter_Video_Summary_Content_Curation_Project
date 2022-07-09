import 'package:movie_curation/utilities/index.dart';
part 'tmdb_movie_video_info_response.g.dart';

@JsonSerializable(createToJson: false)
class TmdbMovieVideoInfoResponse {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'results')
  List<TmdbMovieVideoInfoItemResponse> results;

  TmdbMovieVideoInfoResponse(this.id, this.results);

  factory TmdbMovieVideoInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$TmdbMovieVideoInfoResponseFromJson(json);
}
