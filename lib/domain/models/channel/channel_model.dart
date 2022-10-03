import 'package:movie_curation/domain/models/channel/channel_content_model.dart';

class ChannelModel {
  final String id;
  final String name;
  final int subscribers;
  final String viewCount;
  final String description;
  final String thumbnailUrl;
  final bool? isFavorite;
  final List<ChannelContentModel>? contents;

  ChannelModel({
    required this.id,
    required this.name,
    required this.subscribers,
    required this.description,
    required this.viewCount,
    required this.thumbnailUrl,
    required this.isFavorite,
    required this.contents,
  });

  factory ChannelModel.fromResponse(Map<String, dynamic> response) {
    final detailResponse = response["contents"];

    List<ChannelContentModel> nestedResponse = List<ChannelContentModel>.from(
        detailResponse
            .map((e) => ChannelContentModel.fromResponse(e))
            .toList());

    return ChannelModel(
        id: response["id"],
        viewCount: response["viewCount"],
        thumbnailUrl: response["thumbnailUrl"],
        name: response["name"],
        subscribers: int.parse(response["subscribers"]),
        contents: nestedResponse,
        isFavorite: response["isFavorite"],
        description: response["description"]);
  }
}
