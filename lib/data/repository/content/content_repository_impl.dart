import 'package:movie_curation/data/remote/network/api/content/response/content_recommended_info_response.dart';
import 'package:movie_curation/data/remote/source/content/content_remote_data_source.dart';
import 'package:movie_curation/data/repository/content/content_repository.dart';
import 'package:movie_curation/data/repository/tmdb/tmdb_repository.dart';
import 'package:movie_curation/domain/models/content/content_model.dart';
import 'package:movie_curation/utilities/result.dart';

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
