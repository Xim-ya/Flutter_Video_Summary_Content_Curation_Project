import 'package:movie_curation/domain/base/base_use_case.dart';
import 'package:movie_curation/domain/models/youtube/youtube_search_list_model.dart';
import 'package:movie_curation/utilities/result.dart';
import 'package:youtube_metadata/youtube_metadata.dart'; // 다른 라이브러리와 충돌됨 (Single Import X)

class LoadYoutubeMetaDataListUseCase extends BaseUseCase<List<String>,
    Result<List<YoutubeSearchListItemModel>>> {
  @override
  Future<Result<List<YoutubeSearchListItemModel>>> call(
      List<String> request) async {
    List<YoutubeSearchListItemModel> youtubeVideoInfoList = [];
    for (String videoId in request) {
      final String link = 'https://www.youtube.com/watch?v=$videoId';
      MetaDataModel metaData = await YoutubeMetaData.getData(link);
      youtubeVideoInfoList.add(YoutubeSearchListItemModel(
          videoTitle: metaData.title,
          videoId: videoId,
          thumbnailUrl: metaData.thumbnailUrl));
    }
    return Result.success(youtubeVideoInfoList);
  }
}
