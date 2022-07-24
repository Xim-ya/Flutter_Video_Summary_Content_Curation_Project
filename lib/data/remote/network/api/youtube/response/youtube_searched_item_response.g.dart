// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_searched_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeSearchedItemResponse _$YoutubeSearchedItemResponseFromJson(
        Map<String, dynamic> json) =>
    YoutubeSearchedItemResponse(
      json['kind'] as String,
      json['etag'] as String,
      YoutubeItemIdInfoResponse.fromJson(json['id'] as Map<String, dynamic>),
      YoutubeItemSnippetResponse.fromJson(
          json['snippet'] as Map<String, dynamic>),
    );

YoutubeItemThumbnailInfoResponse _$YoutubeItemThumbnailInfoResponseFromJson(
        Map<String, dynamic> json) =>
    YoutubeItemThumbnailInfoResponse(
      YoutubeItemThumbnailOptionResponse.fromJson(
          json['default'] as Map<String, dynamic>),
      YoutubeItemThumbnailOptionResponse.fromJson(
          json['medium'] as Map<String, dynamic>),
      YoutubeItemThumbnailOptionResponse.fromJson(
          json['high'] as Map<String, dynamic>),
    );

YoutubeItemThumbnailOptionResponse _$YoutubeItemThumbnailOptionResponseFromJson(
        Map<String, dynamic> json) =>
    YoutubeItemThumbnailOptionResponse(
      json['url'] as String?,
      json['width'] as int?,
      json['high'] as int?,
    );

YoutubeItemIdInfoResponse _$YoutubeItemIdInfoResponseFromJson(
        Map<String, dynamic> json) =>
    YoutubeItemIdInfoResponse(
      json['kind'] as String,
      json['videoId'] as String,
    );

YoutubeItemSnippetResponse _$YoutubeItemSnippetResponseFromJson(
        Map<String, dynamic> json) =>
    YoutubeItemSnippetResponse(
      json['publishedAt'] as String,
      json['channelId'] as String,
      json['title'] as String,
      json['description'] as String?,
      YoutubeItemThumbnailInfoResponse.fromJson(
          json['thumbnails'] as Map<String, dynamic>),
      json['channelTitle'] as String,
      json['liveBroadcastContent'] as String,
      json['publishTime'] as String,
    );
