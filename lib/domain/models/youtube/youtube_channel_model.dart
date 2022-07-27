import 'package:movie_curation/data/remote/network/api/youtube/response/youtube_channel_response.dart';

class YoutubeChannelModel {
  final String id;
  final String name;
  final String? description;
  final String publishedAt;
  final String? thumbnailUrl;

  YoutubeChannelModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.publishedAt,
      required this.thumbnailUrl});

  factory YoutubeChannelModel.fromResponse(
      YoutubeChannelDetailResponse response) {
    return YoutubeChannelModel(
        id: response.id,
        name: response.snippet.title,
        description: response.snippet.description,
        publishedAt: response.snippet.publishedAt,
        thumbnailUrl: response.snippet.thumbnails.medium.url);
  }
}
