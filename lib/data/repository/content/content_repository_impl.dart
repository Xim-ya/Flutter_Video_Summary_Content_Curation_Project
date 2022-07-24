import 'package:movie_curation/utilities/index.dart';

class ContentRepositoryImpl implements ContentRepository {
  ContentRepositoryImpl(this._dataSource, this._repository);
  final ContentRemoteDataSource _dataSource;
  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentModel>>> loadRecommendedContentInfo() async {
    List<ContentModel> registeredContents = [];
    List<ContentRecommendedInfoResponse> registeredList =
        await _dataSource.loadRecommendedContentInfo();
    try {
      for (ContentRecommendedInfoResponse content in registeredList) {
        registeredContents.add(
          await _repository.loadMovieDetailInfo(content.contentId).then(
            (value) {
              return ContentModel.fromMovieDetailInfoResponse(
                  value, content.youtubeVideoIdList);
            },
          ),
        );
      }
      return Result.success(registeredContents);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
