// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_channel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeChannelResponse _$YoutubeChannelResponseFromJson(
        Map<String, dynamic> json) =>
    YoutubeChannelResponse(
      json['kind'] as String,
      json['etag'] as String,
      Map<String, int>.from(json['pageInfo'] as Map),
      (json['items'] as List<dynamic>)
          .map((e) =>
              YoutubeChannelDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

YoutubeChannelDetailResponse _$YoutubeChannelDetailResponseFromJson(
        Map<String, dynamic> json) =>
    YoutubeChannelDetailResponse(
      json['kind'] as String,
      json['etag'] as String,
      json['id'] as String,
      YoutubeChannelSnippetResponse.fromJson(
          json['snippet'] as Map<String, dynamic>),
    );

YoutubeChannelSnippetResponse _$YoutubeChannelSnippetResponseFromJson(
        Map<String, dynamic> json) =>
    YoutubeChannelSnippetResponse(
      json['title'] as String,
      json['description'] as String?,
      json['publishedAt'] as String,
      YoutubeItemThumbnailInfoResponse.fromJson(
          json['thumbnails'] as Map<String, dynamic>),
      (json['localized'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      json['country'] as String?,
    );
