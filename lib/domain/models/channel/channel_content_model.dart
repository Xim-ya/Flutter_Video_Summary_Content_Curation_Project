class ChannelContentModel {
  final String contentId;
  final String title;
  final String? type;
  final List<String> youtubeVideoIdList;

  ChannelContentModel(
      {required this.contentId,
      required this.title,
      required this.youtubeVideoIdList,
      required this.type});

  factory ChannelContentModel.fromResponse(Map<String, dynamic> response) {
    final nestedResponse = response["youtubeVideoIdList"] as List<dynamic>;
    final List<String> idList =
        nestedResponse.map((e) => e.toString()).toList();

    return ChannelContentModel(
        contentId: response["contentId"],
        title: response["title"],
        youtubeVideoIdList: idList,
        type: response["type"]);
  }
}
