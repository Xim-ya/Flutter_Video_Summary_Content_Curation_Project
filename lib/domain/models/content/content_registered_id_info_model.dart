import 'package:movie_curation/data/remote/network/api/content/response/content_registered_id_info_item_response.dart';

class ContentRegisteredIdInfoModel {
  final String type;
  final int contentId;

  ContentRegisteredIdInfoModel({required this.type, required this.contentId});

  factory ContentRegisteredIdInfoModel.fromResponse(
      ContentRegisteredIdInfoItemResponse response) {
    return ContentRegisteredIdInfoModel(
        type: response.type, contentId: response.contentId);
  }
}
