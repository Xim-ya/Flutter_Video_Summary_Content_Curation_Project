import 'package:movie_curation/data/remote/network/api/youtube/response/youtube_thumbnail_response.dart';
import 'package:movie_curation/utilities/index.dart';
part 'youtube_searched_item_response.g.dart';

@JsonSerializable(createToJson: false)
class YoutubeSearchedItemResponse {
  @JsonKey(name: 'kind')
  String kind;

  @JsonKey(name: 'etag')
  String etag;

  @JsonKey(name: 'id')
  YoutubeItemIdInfoResponse id;

  @JsonKey(name: 'snippet')
  YoutubeItemSnippetResponse snippet;

  YoutubeSearchedItemResponse(this.kind, this.etag, this.id, this.snippet);

  factory YoutubeSearchedItemResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeSearchedItemResponseFromJson(json);
}

// @JsonSerializable(createToJson: false)
// class YoutubeItemThumbnailInfoResponse {
//   @JsonKey(name: 'default')
//   YoutubeItemThumbnailOptionResponse defaultOption;
//
//   @JsonKey(name: 'medium')
//   YoutubeItemThumbnailOptionResponse medium;
//
//   @JsonKey(name: 'high')
//   YoutubeItemThumbnailOptionResponse high;
//
//   YoutubeItemThumbnailInfoResponse(this.defaultOption, this.medium, this.high);
//
//   factory YoutubeItemThumbnailInfoResponse.fromJson(
//           Map<String, dynamic> json) =>
//       _$YoutubeItemThumbnailInfoResponseFromJson(json);
// }
//
// @JsonSerializable(createToJson: false)
// class YoutubeItemThumbnailOptionResponse {
//   @JsonKey(name: 'url')
//   String? url;
//
//   @JsonKey(name: 'width')
//   int? width;
//
//   @JsonKey(name: 'high')
//   int? high;
//
//   YoutubeItemThumbnailOptionResponse(this.url, this.width, this.high);
//
//   factory YoutubeItemThumbnailOptionResponse.fromJson(
//           Map<String, dynamic> json) =>
//       _$YoutubeItemThumbnailOptionResponseFromJson(json);
// }

@JsonSerializable(createToJson: false)
class YoutubeItemIdInfoResponse {
  @JsonKey(name: 'kind')
  String kind;

  @JsonKey(name: 'videoId')
  String videoId;

  YoutubeItemIdInfoResponse(this.kind, this.videoId);

  factory YoutubeItemIdInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeItemIdInfoResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class YoutubeItemSnippetResponse {
  @JsonKey(name: 'publishedAt')
  String publishedAt;

  @JsonKey(name: 'channelId')
  String channelId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'thumbnails')
  YoutubeItemThumbnailInfoResponse thumbnails;

  @JsonKey(name: 'channelTitle')
  String channelTitle;

  @JsonKey(name: 'liveBroadcastContent')
  String liveBroadcastContent;

  @JsonKey(name: 'publishTime')
  String publishTime;

  YoutubeItemSnippetResponse(
      this.publishedAt,
      this.channelId,
      this.title,
      this.description,
      this.thumbnails,
      this.channelTitle,
      this.liveBroadcastContent,
      this.publishTime);

  factory YoutubeItemSnippetResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeItemSnippetResponseFromJson(json);
}
