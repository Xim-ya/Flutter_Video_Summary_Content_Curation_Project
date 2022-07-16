// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_searched_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeSearchListResponse _$YoutubeSearchListResponseFromJson(
        Map<String, dynamic> json) =>
    YoutubeSearchListResponse(
      json['kind'] as String,
      json['etag'] as String,
      json['nextPageToken'] as String,
      json['regionCode'] as String,
      (json['items'] as List<dynamic>)
          .map((e) =>
              YoutubeSearchedItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
