import 'package:movie_curation/utilities/index.dart';

part 'tmdb_drama_credit_response.g.dart';

@JsonSerializable(createToJson: false)
class TmdbDramaCreditResponse {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'cast')
  List<TmdbCastInfoItemResponse> cast;

  TmdbDramaCreditResponse(this.id, this.cast);

  factory TmdbDramaCreditResponse.fromJson(Map<String, dynamic> json) =>
      _$TmdbDramaCreditResponseFromJson(json);
}
