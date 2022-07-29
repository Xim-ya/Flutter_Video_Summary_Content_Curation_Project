// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_thumbnail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
