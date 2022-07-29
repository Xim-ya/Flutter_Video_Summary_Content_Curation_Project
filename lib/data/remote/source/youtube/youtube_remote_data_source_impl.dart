import 'package:movie_curation/data/remote/network/api/youtube/response/youtube_channel_response.dart';
import 'package:movie_curation/utilities/index.dart';

class YoutubeRemoteDataSourceImpl
    with ApiErrorHandlerMixin
    implements YoutubeRemoteDataSource {
  YoutubeRemoteDataSourceImpl(this._api);
  final YoutubeApi _api;

  /* Youtube - 유튜브 검색 데이터 호출 (컨텐츠 제목을 기준으로)*/
  @override
  Future<YoutubeSearchListResponse> loadYoutubeSearchList(
          String contentTitle) =>
      loadResponseOrThrow(() => _api.loadYoutubeSearchList(contentTitle));

  /* Youtube - 유튜브 단일 채널 정보 호출 */
  @override
  Future<YoutubeChannelResponse> loadYoutubeChannel(String channelId) =>
      loadResponseOrThrow(() => _api.loadYoutubeChannel(channelId));
}
