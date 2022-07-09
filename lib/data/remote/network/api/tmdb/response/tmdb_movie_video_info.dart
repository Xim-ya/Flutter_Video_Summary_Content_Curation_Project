import 'package:json_annotation/json_annotation.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_video_info_item.dart';

part 'tmdb_movie_video_info.g.dart';

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
