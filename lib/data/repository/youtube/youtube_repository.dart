import 'package:movie_curation/utilities/index.dart';

abstract class YoutubeRepository {
  Future<Result<List<YoutubeSearchListItemModel>>> loadYoutubeSearchList(
      String contentTitle);
}
