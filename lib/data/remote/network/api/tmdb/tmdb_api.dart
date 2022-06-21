import 'package:dio/dio.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_movie_response.dart';
import 'package:retrofit/retrofit.dart';
import 'response/tmdb_popular_drama_response.dart';

part 'tmdb_api.g.dart';

// 인기 드라마 컨텐츠
// "https://api.themoviedb.org/3/tv/popular?api_key=b40235ce96defc556ca26d48159f5f13&language=ko-KR&page=1";

// 인기 영화 컨텐츠
// "https://api.themoviedb.org/3/movie/popular?api_key=b40235ce96defc556ca26d48159f5f13&language=ko-KR&page=1"

@RestApi(baseUrl: "https://api.themoviedb.org/3")
abstract class TMDBApi {
  factory TMDBApi(Dio dio, {String baseUrl}) = _TMDBApi;

  //인기 영화 호출
  @GET(
      "/movie/popular?api_key=b40235ce96defc556ca26d48159f5f13&language=ko-KR&page=1")
  Future<TmdbPopularMovieResponse> loadPopularMovie();

  // 인기 드라마 호출
  @GET(
      "/tv/popular?api_key=b40235ce96defc556ca26d48159f5f13&language=ko-KR&page=1")
  Future<TmdbPopularDramaResponse> loadPopularDrama();
}
