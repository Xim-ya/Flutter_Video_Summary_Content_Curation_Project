import 'package:movie_curation/utilities/index.dart';

class YoutubeVM extends GetxController {
  LoadingStatus loadingStatus = LoadingStatus.empty;

  /* Model 연동 */
  YoutubeCore _model;
  YoutubeVM({required YoutubeCore model}) : _model = model;

  /* 인스턴스 */
  List<Youtube> get youtubeSearchedQueryList {
    return _model.youtubeSearchedQueryList;
  }

  fetchYoutubeSearchQuery(String movieTitle) async {
    print(movieTitle);
    loadingStatus = LoadingStatus.empty;
    List<Youtube> youtubeList =
        await YoutubeApi().fetchYoutubeContents(movieTitle);
    _model.youtubeSearchedQueryList = youtubeList.toList();
    update();

    loadingStatus = LoadingStatus.done;
    update();
  }
}
