import 'package:dio/dio.dart';
import 'package:movie_curation/data/remote/network/api/youtube/response/youtube_channel_response.dart';
import 'package:movie_curation/data/remote/network/api/youtube/response/youtube_searched_list_response.dart';
import 'package:movie_curation/utilities/index.dart';
import 'package:retrofit/retrofit.dart';
part 'youtube_api.g.dart';

@RestApi(baseUrl: 'https://www.googleapis.com/youtube/v3')
abstract class YoutubeApi {
  factory YoutubeApi(Dio dio, {String baseUrl}) = _YoutubeApi;

  // YotubeAPI V3 > 검색값으로 유튜브 [영상 리스트] 호출
  @GET(
      '/search?part=snippet&key=AIzaSyCIYVB7l7anQLIxmops2GWA6sQFmG8VxmY&q={contentTitle}&영화리뷰')
  Future<YoutubeSearchListResponse> loadYoutubeSearchList(
      @Path("contentTitle") String contentTitle);

  // YotubeAPI V3 > 채널 정보 호출
  @GET(
      '/channels?part=snippet&key=AIzaSyCIYVB7l7anQLIxmops2GWA6sQFmG8VxmY&id={channelId}')
  Future<YoutubeChannelResponse> loadYoutubeChannel(
      @Path('channelId') String channelId);
}
//  https://www.googleapis.com/youtube/v3/channels?part=snippet&key=AIzaSyCIYVB7l7anQLIxmops2GWA6sQFmG8VxmY&id=UCtLzE2zAxNxIIMO5-A8RuhQ
// https://www.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyCIYVB7l7anQLIxmops2GWA6sQFmG8VxmY&q=미니언즈&영화리뷰
