import 'package:movie_curation/data/remote/network/api/youtube/youtube_api.dart';
import 'package:movie_curation/utilities/index.dart';

class YoutubeRemoteDataSourceImpl
    with ApiErrorHandlerMixin
    implements YoutubeRemoteDataSource {
  YoutubeRemoteDataSourceImpl(this._api);
  final YoutubeApi _api;

  @override
  Future<YoutubeSearchListResponse> loadYoutubeSearchList(
          String contentTitle) =>
      loadResponseOrThrow(() => _api.loadYoutubeSearchList(contentTitle));
}
