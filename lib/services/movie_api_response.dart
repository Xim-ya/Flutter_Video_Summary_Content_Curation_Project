import 'package:dio/dio.dart';
import 'package:movie_curation/utilities/index.dart';

class MovieApi {
  var dio = Dio();

  Future<List<Movie>> fetchPopularMovies() async {
    String url =
        "https://api.themoviedb.org/3/movie/popular?api_key=b40235ce96defc556ca26d48159f5f13&language=ko-KR&page=1";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result["results"];
      print("API 호출 성공");
      return list.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception("API 호출 실패");
    }
  }

  Future<List<Genres>> fetchMovieGenre() async {
    String url =
        "https://api.themoviedb.org/3/movie/414906?api_key=b40235ce96defc556ca26d48159f5f13&language=ko-KR&page=1";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data['genres'];
      Iterable list = result;
      return list.map((e) => Genres.fromJson(e)).toList();
      // return list.map((e) => MovieGenre.fromJson(e)).toList();
    } else {
      throw Exception("API 호출 실패");
    }
  }
}
