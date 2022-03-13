import 'package:dio/dio.dart';

import 'package:movie_curation/utilities/index.dart';

class MovieApi {
  var dio = Dio();

  // TODO: 나중에 api Key들을 git ignore 해야됨

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

  Future<List<Genres>> fetchMovieGenre(int movieId) async {
    String url =
        "https://api.themoviedb.org/3/movie/${movieId}?api_key=b40235ce96defc556ca26d48159f5f13&language=ko-KR&page=1";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data['genres'];
      Iterable list = result;
      return list.map((e) => Genres.fromJson(e)).toList();
    } else {
      throw Exception("API 호출 실패");
    }
  }

  Future<List<Actor>> fetchActors() async {
    String url =
        "https://api.themoviedb.org/3/movie/634649/credits?api_key=b40235ce96defc556ca26d48159f5f13&language=ko-KR&page=1";

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data['cast'];
      Iterable list = result;
      return list.map((e) => Actor.fromJson(e)).toList();
    } else {
      throw Exception("API 호출 실패");
    }
  }
}
