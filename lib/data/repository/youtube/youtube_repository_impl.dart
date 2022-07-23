import 'package:movie_curation/data/remote/source/youtube/youtube_remote_data_source.dart';
import 'package:movie_curation/data/repository/youtube/youtube_repository.dart';
import 'package:movie_curation/domain/models/youtube/youtube_search_list_model.dart';
import 'package:movie_curation/utilities/result.dart';

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
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
