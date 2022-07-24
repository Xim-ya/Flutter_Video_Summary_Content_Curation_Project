import 'package:movie_curation/utilities/index.dart';

class YoutubeRepositoryImpl implements YoutubeRepository {
  YoutubeRepositoryImpl(this._dataSource);
  final YoutubeRemoteDataSource _dataSource;

  @override
  Future<Result<List<YoutubeSearchListItemModel>>> loadYoutubeSearchList(
      String contentTitle) async {
    try {
      final List<YoutubeSearchListItemModel> tempYoutubeSearchList =
          []; //여기에다가 값을 집어 넣음.

      final response = await _dataSource
          .loadYoutubeSearchList(contentTitle)
          .then((value) => value.items
              .map(YoutubeSearchListItemModel.fromResponse)
              .toList());

      return Result.success([
        YoutubeSearchListItemModel(
            videoTitle: '', videoId: '', thumbnailUrl: '')
      ]); //
      return Result.success(response); // 유튜브 컨텐츠 비디오 아이디 값이 없을 때.
      // return Result.success([
      //   YoutubeSearchListItemModelNew(
      //       videoTitle: '', videoId: 'videoId', thumbnailUrl: '')
      // ]);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  // @override
  // Future<Result<List<YoutubeSearchListItemModelNew>>> loadYoutubeSearchList(
  //     String contentTitle) async {
  //   try {
  //     final response = await _dataSource
  //         .loadYoutubeSearchList(contentTitle)
  //         .then((value) => value.items
  //             .map(YoutubeSearchListItemModel.fromResponse)
  //             .toList());
  //     Result.success([YoutubeSearchListItemModelNew(
  //         videoTitle: '', videoId: 'videoId', thumbnailUrl: '')]);
  //   } on Exception catch (e) {
  //     return Result.failure(e);
  //   }
  // }
}
