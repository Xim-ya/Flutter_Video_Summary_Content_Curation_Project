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
