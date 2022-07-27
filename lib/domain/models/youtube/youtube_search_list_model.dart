import 'package:movie_curation/utilities/index.dart';

class YoutubeSearchListParentModel {
  final List<YoutubeVideoContentModel> items;

  YoutubeSearchListParentModel({required this.items});

  factory YoutubeSearchListParentModel.fromResponse(
      YoutubeSearchListResponse response) {
    List<YoutubeVideoContentModel> result = (response.items)
        .map((e) => YoutubeVideoContentModel.fromResponse(e))
        .toList();
    return YoutubeSearchListParentModel(items: result);
  }
}

class YoutubeVideoContentModel {
  final String? videoTitle;
  final String? videoId;
  final String? thumbnailUrl;
  final String? profileUrl;

  YoutubeVideoContentModel(
      {required this.videoTitle,
      required this.videoId,
      required this.thumbnailUrl,
      required this.profileUrl});

  factory YoutubeVideoContentModel.fromResponse(
      YoutubeSearchedItemResponse response) {
    return YoutubeVideoContentModel(
      videoTitle: response.snippet.title,
      videoId: response.id.videoId,
      thumbnailUrl: response.snippet.thumbnails.medium.url,
      profileUrl: null,
    );
  }
}
