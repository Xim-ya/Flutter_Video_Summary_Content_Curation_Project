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
      json['id'] as Map<String, dynamic>,
      YoutubeItemSnippetResponse.fromJson(
          json['snippet'] as Map<String, dynamic>),
    );

YoutubeItemSnippetResponse _$YoutubeItemSnippetResponseFromJson(
        Map<String, dynamic> json) =>
    YoutubeItemSnippetResponse(
      json['publishedAt'] as String,
      json['channelId'] as String,
      json['title'] as String,
      json['description'] as String?,
      (json['thumbnails'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Map<String, dynamic>),
      ),
      json['channelTitle'] as String,
      json['liveBroadcastContent'] as String,
      json['publishTime'] as String,
    );
