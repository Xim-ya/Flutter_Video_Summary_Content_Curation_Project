import 'package:dio/dio.dart';
import 'package:movie_curation/data/remote/network/api/youtube/response/youtube_searched_list_response.dart';
import 'package:movie_curation/utilities/index.dart';
import 'package:retrofit/retrofit.dart';
part 'youtube_api.g.dart';

@RestApi(baseUrl: 'https://www.googleapis.com/youtube/v3')
abstract class YoutubeApi {
  factory YoutubeApi(Dio dio, {String baseUrl}) = _YoutubeApi;

  @GET(
      '/search?part=snippet&key=AIzaSyCIYVB7l7anQLIxmops2GWA6sQFmG8VxmY&q={contentTitle}&영화리뷰')
  Future<YoutubeSearchListResponse> loadYoutubeSearchList(
      @Path("contentTitle") String contentTitle);
}

// https://www.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyCIYVB7l7anQLIxmops2GWA6sQFmG8VxmY&q=미니언즈&영화리뷰
