import 'package:movie_curation/utilities/index.dart';
part 'content_registered_id_info_item_response.g.dart';

@JsonSerializable(createToJson: false)
class ContentRegisteredIdInfoItemResponse {
  @JsonKey(name: 'contentId')
  int contentId;

  @JsonKey(name: 'documentId')
  int documentId;

  ContentRegisteredIdInfoItemResponse(this.contentId, this.documentId);

  factory ContentRegisteredIdInfoItemResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ContentRegisteredIdInfoItemResponseFromJson(json);
}
