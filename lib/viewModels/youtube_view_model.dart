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

  List<VideoDetail> get videoLikesCount {
    return _model.videoDetailList;
  }

  fetchYoutubeSearchQuery(String movieTitle) async {
    print("YOUTUBE VM $movieTitle");
    loadingStatus = LoadingStatus.empty;
    List<Youtube> youtubeList =
        await YoutubeApiOld().fetchYoutubeContents(movieTitle);
    _model.youtubeSearchedQueryList = youtubeList.toList();
    update();

    loadingStatus = LoadingStatus.done;
    update();
  }
  // https://www.googleapis.com/youtube/v3/videos?id=N1uXUEvprJU,hzFLd58HmDw&key=AIzaSyCIYVB7l7anQLIxmops2GWA6sQFmG8VxmY&part=statistics

  fetchVideoLikesCount() async {
    // YoutubeApi().fetchVideoLikes();
    // List<VideoDetail> videoDetailList = await YoutubeApi().fetchVideoLikes();
    // _model.videoDetailList = videoDetailList;
    // update();
  }
}
