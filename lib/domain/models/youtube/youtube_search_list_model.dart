import 'package:movie_curation/data/remote/network/api/youtube/response/youtube_searched_item_response.dart';
import 'package:movie_curation/data/remote/network/api/youtube/response/youtube_searched_list_response.dart';

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
  final String etag;
  final Map<String, dynamic> id;
  final YoutubeItemSnippetModel snippet;

  YoutubeSearchListItemModel(
      {required this.etag, required this.id, required this.snippet});

  factory YoutubeSearchListItemModel.fromResponse(
      YoutubeSearchedItemResponse response) {
    YoutubeItemSnippetModel result =
        YoutubeItemSnippetModel.fromResponse(response.snippet);
    // List<YoutubeItemSnippetModel> result = (response.snippet)
    //     .map((e) => YoutubeItemSnippetModel.fromResponse(e))
    //     .toList();
    return YoutubeSearchListItemModel(
        etag: response.etag, id: response.id, snippet: result);
  }
}

class YoutubeItemSnippetModel {
  final String channelId;
  final String? description;
  final Map<String, Map<String, dynamic>> thumbnails;
  final String channelTitle;
  final String title;

  YoutubeItemSnippetModel({
    required this.channelId,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.title,
  });

  factory YoutubeItemSnippetModel.fromResponse(
      YoutubeItemSnippetResponse response) {
    return YoutubeItemSnippetModel(
        channelId: response.channelId,
        description: response.description,
        thumbnails: response.thumbnails,
        channelTitle: response.channelTitle,
        title: response.title);
  }
}

// class YoutubeThumbnailItemModel {
//   final YoutubeThumbnailDefaultModel defaultThumbnail;
//   final YoutubeThumbnailDefaultModel medium;
//   final YoutubeThumbnailDefaultModel high;
//
//
//   YoutubeThumbnailItemModel({required this.defaultThumbnail, required this.medium, required this.high});
//
//   factory YoutubeThumbnailItemModel.fromResponse(YoutubeThumbnailItemResponse response) {
//
//     YoutubeThumbnailItemModel(medium: null)
//   }
// }

// class YoutubeThumbnailDefaultModel {
//   final String url;
//   final int width;
//   final int height;
//
//   YoutubeThumbnailDefaultModel(
//       {required this.url, required this.width, required this.height});
//
//   factory YoutubeThumbnailDefaultModel.fromResponse(
//           YoutubeThumbnailDefaultModel response) =>
//       YoutubeThumbnailDefaultModel(
//           url: response.url, width: response.width, height: response.height);
// }
