import 'package:movie_curation/utilities/data/firebase_temp_data.dart';
import 'package:movie_curation/utilities/index.dart';

class LoadRegisteredContentsUseCase
    extends BaseUseCase<int, Result<List<ContentModel>>> {
  LoadRegisteredContentsUseCase(this._repository);

  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentModel>>> call(int request) async {
    List<ContentModel> registeredContents = [];
    List<RegisteredContent> registeredList = FirebaseTemp.registerContentList;
    try {
      for (RegisteredContent content in registeredList) {
        registeredContents.add(await _repository
            .loadMovieDetailInfo(content.contentId)
            .then((value) {
          return ContentModel.fromMovieDetailInfoResponse(
              value, content.youtubeVideIdList);
        }));
      }
      return Result.success(registeredContents);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
