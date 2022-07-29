import 'package:movie_curation/utilities/index.dart';

part 'youtube_thumbnail_response.g.dart';

@JsonSerializable(createToJson: false)
class YoutubeItemThumbnailInfoResponse {
  @JsonKey(name: 'default')
  YoutubeItemThumbnailOptionResponse defaultOption;

  @JsonKey(name: 'medium')
  YoutubeItemThumbnailOptionResponse medium;

  @JsonKey(name: 'high')
  YoutubeItemThumbnailOptionResponse high;

  YoutubeItemThumbnailInfoResponse(this.defaultOption, this.medium, this.high);

  factory YoutubeItemThumbnailInfoResponse.fromJson(
          Map<String, dynamic> json) =>
      _$YoutubeItemThumbnailInfoResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class YoutubeItemThumbnailOptionResponse {
  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'width')
  int? width;

  @JsonKey(name: 'high')
  int? high;

  YoutubeItemThumbnailOptionResponse(this.url, this.width, this.high);

  factory YoutubeItemThumbnailOptionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$YoutubeItemThumbnailOptionResponseFromJson(json);
}
