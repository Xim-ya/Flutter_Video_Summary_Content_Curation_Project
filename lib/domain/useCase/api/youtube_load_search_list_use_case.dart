import 'package:movie_curation/data/repository/youtube/youtube_repository.dart';
import 'package:movie_curation/domain/base/base_use_case.dart';
import 'package:movie_curation/domain/models/youtube/youtube_search_list_model.dart';
import 'package:movie_curation/utilities/index.dart';

class YoutubeLoadSearchListUseCase
    extends BaseUseCase<String, Result<List<YoutubeSearchListItemModel>>> {
  YoutubeLoadSearchListUseCase(this._repository);
  final YoutubeRepository _repository;

  @override
  Future<Result<List<YoutubeSearchListItemModel>>> call(String request) {
    return _repository.loadYoutubeSearchList(request);
  }
}
