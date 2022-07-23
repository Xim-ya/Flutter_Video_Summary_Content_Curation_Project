import 'package:movie_curation/data/remote/network/api/content/content_api.dart';
import 'package:movie_curation/data/remote/network/api/content/response/content_recommended_info_response.dart';
import 'package:movie_curation/data/remote/source/content/content_remote_data_source.dart';
import 'package:movie_curation/utilities/index.dart';

class ContentRemoteDataSourceImpl
    with ApiErrorHandlerMixin
    implements ContentRemoteDataSource {
  ContentRemoteDataSourceImpl(this._api);
  final ContentApi _api;

  @override
  Future<List<ContentRecommendedInfoResponse>> loadRecommendedContentInfo() =>
      loadResponseOrThrow(() => _api.loadRecommendedContentInfo());
}
