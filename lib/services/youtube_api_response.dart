import 'package:dio/dio.dart';
import 'package:movie_curation/utilities/index.dart';

class YoutubeApi {
  var dio = Dio();

  Future<List<Youtube>> fetchYoutubeContents(String movieTitle) async {
    String url =
        "https://www.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyCIYVB7l7anQLIxmops2GWA6sQFmG8VxmY&q=$movieTitle&영화리뷰";

    final response = await dio.get(url);

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final result = response.data;
      Iterable list = result["items"];
      return list.map((e) => Youtube.fromJson(e)).toList();
    } else {
      throw Exception("API 호출 실패");
    }
  }
}

//TODO: Video Likes 처리는 공부가 좀 더 필요할듯
// Future<VideoDetail> fetchVideoLikes(String videoId) async {
//   String url =
//       "https://www.googleapis.com/youtube/v3/videos?id=$videoId&key=AIzaSyCIYVB7l7anQLIxmops2GWA6sQFmG8VxmY&part=statistics";
//   final response = await dio.get(url);
//   if (response.statusCode! >= 200 && response.statusCode! < 300) {
//     final result = response.data;
//     final list = result["items"][0];
//     return list.map((e) => VideoDetail.fromJson(e)).toList();
//   } else {
//     throw Exception("API 호출 실패");
//   }
// }
