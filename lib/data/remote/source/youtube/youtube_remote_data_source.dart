import 'package:movie_curation/utilities/index.dart';

abstract class YoutubeRemoteDataSource {
  Future<YoutubeSearchListResponse> loadYoutubeSearchList(String contentTitle);
  Future<YoutubeChannelResponse> loadYoutubeChannel(String channelId);
}
