import 'package:movie_curation/utilities/index.dart';

part 'youtube_searched_item_response.g.dart';

@JsonSerializable(createToJson: false)
class YoutubeSearchedItemResponse {
  @JsonKey(name: 'kind')
  String kind;

  @JsonKey(name: 'etag')
  String etag;

  @JsonKey(name: 'id')
  Map<String, dynamic> id;

  @JsonKey(name: 'snippet')
  YoutubeItemSnippetResponse snippet;

  YoutubeSearchedItemResponse(this.kind, this.etag, this.id, this.snippet);

  factory YoutubeSearchedItemResponse.fromJson(Map<String, dynamic> json) =>
      _$YoutubeSearchedItemResponseFromJson(json);
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
  Map<String, Map<String, dynamic>> thumbnails;

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

// @JsonSerializable(createToJson: false)
// class YoutubeThumbnailItemResponse {
//   @JsonKey(name: "default")
//   final YoutubeThumbnailsDefaultsResponse defaultThumbnail;
//
//   @JsonKey(name: "medium")
//   final YoutubeThumbnailsDefaultsResponse medium;
//
//   @JsonKey(name: "high")
//   final YoutubeThumbnailsDefaultsResponse high;
//
//   YoutubeThumbnailItemResponse(
//       {required this.defaultThumbnail,
//       required this.medium,
//       required this.high});
//
//   factory YoutubeThumbnailItemResponse.fromJson(Map<String, dynamic> json) =>
//       _$YoutubeThumbnailItemResponseFromJson(json);
// }

// @JsonSerializable(createToJson: false)
// class YoutubeThumbnailsDefaultsResponse {
//   @JsonKey(name: 'url')
//   String url;
//
//   @JsonKey(name: 'width')
//   int width;
//
//   @JsonKey(name: 'height')
//   int height;
//
//   YoutubeThumbnailsDefaultsResponse(this.url, this.width, this.height);
//
//   factory YoutubeThumbnailsDefaultsResponse.fromJson(
//           Map<String, dynamic> json) =>
//       _$YoutubeThumbnailsDefaultsResponseFromJson(json);
// }
