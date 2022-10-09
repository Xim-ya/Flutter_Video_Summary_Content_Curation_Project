import 'package:movie_curation/utilities/index.dart';
part 'content_registered_id_info_item_response.g.dart';

@JsonSerializable(createToJson: false)
class ContentRegisteredIdInfoItemResponse {
  @JsonKey(name: 'contentId')
  int contentId;

  @JsonKey(name: 'type')
  String type;

  ContentRegisteredIdInfoItemResponse(this.contentId, this.type);

  factory ContentRegisteredIdInfoItemResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ContentRegisteredIdInfoItemResponseFromJson(json);
}
