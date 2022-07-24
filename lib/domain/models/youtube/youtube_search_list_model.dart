import 'package:movie_curation/utilities/index.dart';

class YoutubeSearchListParentModel {
  final List<YoutubeSearchListItemModel> items;

  YoutubeSearchListParentModel({required this.items});

  factory YoutubeSearchListParentModel.fromResponse(
      YoutubeSearchListResponse response) {
    List<YoutubeSearchListItemModel> result = (response.items)
        .map((e) => YoutubeSearchListItemModel.fromResponse(e))
        .toList();
    return YoutubeSearchListParentModel(items: result);
  }
}

class YoutubeSearchListItemModel {
  final String? videoTitle;
  final String? videoId;
  final String? thumbnailUrl;

  YoutubeSearchListItemModel(
      {required this.videoTitle,
      required this.videoId,
      required this.thumbnailUrl});

  factory YoutubeSearchListItemModel.fromResponse(
      YoutubeSearchedItemResponse response) {
    return YoutubeSearchListItemModel(
        videoTitle: response.snippet.title,
        videoId: response.id.videoId,
        thumbnailUrl: response.snippet.thumbnails.medium.url);
  }
}
