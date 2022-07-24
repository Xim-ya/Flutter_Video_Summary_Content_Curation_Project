import 'package:movie_curation/utilities/index.dart';

class YoutubeRepositoryImpl implements YoutubeRepository {
  YoutubeRepositoryImpl(this._dataSource);
  final YoutubeRemoteDataSource _dataSource;

  @override
  Future<Result<List<YoutubeSearchListItemModel>>> loadYoutubeSearchList(
      String contentTitle) async {
    try {
      final response = await _dataSource
          .loadYoutubeSearchList(contentTitle)
          .then((value) => value.items
              .map(YoutubeSearchListItemModel.fromResponse)
              .toList());
      return Result.success(response);
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
