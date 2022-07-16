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
