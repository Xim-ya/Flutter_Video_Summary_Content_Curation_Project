import 'package:movie_curation/utilities/index.dart';

class YoutubeFormat {
  final Youtube youtubeMetaData;
  final VideoDetail videoDetail;

  YoutubeFormat({required this.youtubeMetaData, required this.videoDetail});

  factory YoutubeFormat.fromJson(Map<String, dynamic> json) =>
      YoutubeFormat(youtubeMetaData: json[""], videoDetail: json[""]);
}
