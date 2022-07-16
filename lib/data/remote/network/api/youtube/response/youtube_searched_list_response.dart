import 'package:movie_curation/utilities/index.dart';
part 'youtube_searched_list_response.g.dart';

@JsonSerializable(createToJson: false)
class YoutubeSearchListResponse {
  @JsonKey(name: 'kind')
  String kind;

  @JsonKey(name: 'etag')
  String etag;

  @JsonKey(name: 'nextPageToken')
  String nextPageToken;

  @JsonKey(name: 'regionCode')
  String regionCode;

  @JsonKey(name: 'items')
  List<YoutubeSearchedItemResponse> items;

  YoutubeSearchListResponse(
      this.kind, this.etag, this.nextPageToken, this.regionCode, this.items);

  factory YoutubeSearchListResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeSearchListResponseFromJson(json);
}
