import '../../../utilities/index.dart';

class LoadChannelContentListUseCase
    extends BaseUseCase<List<ChannelContentModel>, Result<List<ContentModel>>> {
  LoadChannelContentListUseCase(this._tmdbRepository, this._channelRepository);

  final TmdbRepository _tmdbRepository;
  final ChannelRepository _channelRepository;

  @override
  Future<Result<List<ContentModel>>> call(
      List<ChannelContentModel> request) async {
    print("LOAD!!");
    print(request[0].type);
    /* 1. Channel >  [contents]  > type & contentId 정보 확인 */
    // `content Id`로 컨텐츠 정보 호출
    List<ContentModel> contentList = [];

    for (var e in request) {
      print("neste Block");
      if (e.type == "movie") {
        print(e.contentId);
        final response = await _tmdbRepository
            .loadMovieDetailInfo(int.parse(e.contentId))
            .then((value) => value.getOrThrow());
        contentList.add(response);
        print("USECASE SUCCESS");
      } else {
        print("USECASE FALSE");
        // tv(darama)
      }
    }
    return Result.success(contentList);
  }
}
