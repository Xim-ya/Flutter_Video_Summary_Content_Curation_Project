class ChannelInfoModel {
  final String id;
  final String channelUrl;
  final String name;
  final double rateScore;
  final int likesCount;
  final int subscribers;
  final int videoCount;
  final String description;
  final String customDescription;
  final List<int> contentIdList;
  final List<UserCommentModel> comments;

  ChannelInfoModel(
      {required this.id,
      required this.channelUrl,
      required this.name,
      required this.rateScore,
      required this.likesCount,
      required this.subscribers,
      required this.videoCount,
      required this.description,
      required this.customDescription,
      required this.contentIdList,
      required this.comments});
}

class UserCommentModel {
  final String name;
  final String comment;

  UserCommentModel({required this.name, required this.comment});
}
