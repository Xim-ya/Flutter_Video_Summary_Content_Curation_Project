import 'package:movie_curation/utilities/index.dart';

abstract class YoutubeRepository {
  Future<Result<List<YoutubeVideoContentModel>>> loadYoutubeSearchList(
      String contentTitle);

  Future<Result<YoutubeChannelModel>> loadYoutubeChannel(String channelId);
}
