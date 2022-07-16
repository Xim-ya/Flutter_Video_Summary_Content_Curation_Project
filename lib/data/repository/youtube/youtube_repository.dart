import 'package:movie_curation/domain/models/youtube/youtube_search_list_model.dart';
import 'package:movie_curation/utilities/index.dart';

abstract class YoutubeRepository {
  Future<Result<List<YoutubeSearchListItemModel>>> loadYoutubeSearchList(
      String contentTitle);
}
