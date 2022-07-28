import 'package:movie_curation/data/repository/youtube/youtube_repository.dart';
import 'package:movie_curation/domain/base/base_use_case.dart';
import 'package:movie_curation/domain/models/youtube/youtube_search_list_model.dart';
import 'package:movie_curation/utilities/regex.dart';
import 'package:movie_curation/utilities/result.dart';
import 'package:youtube_metadata/youtube_metadata.dart'; // 다른 라이브러리와 충돌됨 (Single Import X)

class LoadYoutubeMetaDataListUseCase
    extends BaseUseCase<List<String>, Result<List<YoutubeVideoContentModel>>> {
  LoadYoutubeMetaDataListUseCase(this._youtubeRepository);

  final YoutubeRepository _youtubeRepository;

  @override
  Future<Result<List<YoutubeVideoContentModel>>> call(
      List<String> request) async {
    List<YoutubeVideoContentModel> youtubeVideoInfoList = [];
    for (String videoId in request) {
      final String link = 'https://www.youtube.com/watch?v=$videoId';
      MetaDataModel metaData = await YoutubeMetaData.getData(link);
      final String channelId = Regex.getChannelId(metaData.authorUrl!);

      print(channelId);
      // final response = await _youtubeRepository.loadYoutubeChannel(channelId);
      // String? channelThumbnail;
      // response.fold(onSuccess: (data) {
      //   channelThumbnail = data.thumbnailUrl;
      // }, onFailure: (error) {
      //   channelThumbnail = null;
      //   print("error");
      // });
      // print(channelThumbnail);
      youtubeVideoInfoList.add(
        YoutubeVideoContentModel(
          videoTitle: metaData.title,
          videoId: videoId,
          thumbnailUrl: metaData.thumbnailUrl,
          profileUrl: metaData.version,
        ),
      );
    }
    return Result.success(youtubeVideoInfoList);
  }
}
