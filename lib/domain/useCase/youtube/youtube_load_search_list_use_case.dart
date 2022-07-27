import 'package:movie_curation/domain/base/base_two_param_use_case.dart';
import 'package:movie_curation/utilities/index.dart';

class YoutubeLoadSearchListUseCase
    extends BaseUseCase<String, Result<List<YoutubeVideoContentModel>>> {
  YoutubeLoadSearchListUseCase(this._repository);
  final YoutubeRepository _repository;

  @override
  Future<Result<List<YoutubeVideoContentModel>>> call(String request) {
    return _repository.loadYoutubeSearchList(request);
  }
}
