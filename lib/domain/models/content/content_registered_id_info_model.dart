import 'package:movie_curation/data/remote/network/api/content/response/content_registered_id_info_item_response.dart';

class ContentRegisteredIdInfoModel {
  final int documentId;
  final int contentId;

  ContentRegisteredIdInfoModel(
      {required this.documentId, required this.contentId});

  factory ContentRegisteredIdInfoModel.fromResponse(
      ContentRegisteredIdInfoItemResponse response) {
    return ContentRegisteredIdInfoModel(
        documentId: response.documentId, contentId: response.contentId);
  }
}
