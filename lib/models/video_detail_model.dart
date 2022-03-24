class VideoDetail {
  final String viewCount;
  final String likeCount;
  final String commentCount;

  VideoDetail(
      {required this.viewCount,
      required this.likeCount,
      required this.commentCount});

  factory VideoDetail.fromJson(Map<String, dynamic> json) => VideoDetail(
      viewCount: json["viewCount"],
      likeCount: json["likeCount"],
      commentCount: json["commentCount"]);
}
