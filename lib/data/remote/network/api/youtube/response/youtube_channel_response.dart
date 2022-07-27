import 'package:movie_curation/data/remote/network/api/youtube/response/youtube_thumbnail_response.dart';
import 'package:movie_curation/utilities/index.dart';

part 'youtube_channel_response.g.dart';

@JsonSerializable(createToJson: false)
class YoutubeChannelResponse {
  @JsonKey(name: 'kind')
  String kind;

  @JsonKey(name: 'etag')
  String etag;

  @JsonKey(name: 'pageInfo')
  Map<String, int> pageInfo;

  @JsonKey(name: 'items')
  List<YoutubeChannelDetailResponse> items;

  YoutubeChannelResponse(this.kind, this.etag, this.pageInfo, this.items);

  factory YoutubeChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeChannelResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class YoutubeChannelDetailResponse {
  @JsonKey(name: 'kind')
  String kind;

  @JsonKey(name: 'etag')
  String etag;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'snippet')
  YoutubeChannelSnippetResponse snippet;

  YoutubeChannelDetailResponse(this.kind, this.etag, this.id, this.snippet);

  factory YoutubeChannelDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeChannelDetailResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class YoutubeChannelSnippetResponse {
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'publishedAt')
  String publishedAt;

  @JsonKey(name: 'thumbnails')
  YoutubeItemThumbnailInfoResponse thumbnails;

  @JsonKey(name: 'localized')
  Map<String, String>? localized;

  @JsonKey(name: 'country')
  String? country;

  YoutubeChannelSnippetResponse(this.title, this.description, this.publishedAt,
      this.thumbnails, this.localized, this.country);

  factory YoutubeChannelSnippetResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeChannelSnippetResponseFromJson(json);
}
