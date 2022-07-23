import 'package:cloud_firestore/cloud_firestore.dart';

class ContentRecommendedInfoResponse {
  final int contentId;
  final String? title;
  final int type;
  final List<String> youtubeVideoIdList;

  ContentRecommendedInfoResponse(
      {required this.contentId,
      required this.title,
      required this.type,
      required this.youtubeVideoIdList});

  factory ContentRecommendedInfoResponse.fromResponse(
      Map<String, dynamic> response) {
    List<dynamic> videoList = response['youtubeVideIdList'];
    return ContentRecommendedInfoResponse(
        contentId: response['contentId'],
        title: response['title'],
        type: response['type'],
        youtubeVideoIdList: videoList.cast<String>());
  }
}
