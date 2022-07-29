import 'package:movie_curation/data/remote/network/api/youtube/response/youtube_channel_response.dart';
import 'package:movie_curation/utilities/index.dart';

abstract class YoutubeRemoteDataSource {
  Future<YoutubeSearchListResponse> loadYoutubeSearchList(String contentTitle);
  Future<YoutubeChannelResponse> loadYoutubeChannel(String channelId);
}
