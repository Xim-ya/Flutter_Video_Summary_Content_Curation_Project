import 'package:dio/dio.dart';
import 'package:movie_curation/utilities/index.dart';

class YoutubeApi {
  var dio = Dio();

  Future<List<Youtube>> fetchYoutubeContents() async {
    String url =
        "https://www.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyCIYVB7l7anQLIxmops2GWA6sQFmG8VxmY&q=스파이더맨:노웨이영화리뷰";

    final response = await dio.get(url);

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final result = response.data;
      Iterable list = result["items"];
      print("API 호출 성공 (YOUTUBE CONTENTS");
      return list.map((e) => Youtube.fromJson(e)).toList();
    } else {
      throw Exception("API 호출 실패");
    }
  }
}
