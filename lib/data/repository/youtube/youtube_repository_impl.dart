import 'package:movie_curation/domain/models/youtube/youtube_channel_model.dart';
import 'package:movie_curation/utilities/index.dart';

class YoutubeRepositoryImpl implements YoutubeRepository {
  YoutubeRepositoryImpl(this._dataSource);
  final YoutubeRemoteDataSource _dataSource;

  @override
  Future<Result<List<YoutubeVideoContentModel>>> loadYoutubeSearchList(
      String contentTitle) async {
    try {
      final response = await _dataSource
          .loadYoutubeSearchList(contentTitle)
          .then((value) =>
              value.items.map(YoutubeVideoContentModel.fromResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<YoutubeChannelModel>> loadYoutubeChannel(
      String channelId) async {
    try {
      final response = await _dataSource
          .loadYoutubeChannel(channelId)
          .then((value) => YoutubeChannelModel.fromResponse(value.items[0]));
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
