import 'package:movie_curation/data/repository/channel/channel_repository.dart';
import 'package:movie_curation/domain/models/channel/channel_content_model.dart';
import '../../../utilities/index.dart';

class LoadChannelContentListUseCase
    extends BaseUseCase<List<ChannelContentModel>, Result<List<ContentModel>>> {
  LoadChannelContentListUseCase(this._tmdbRepository, this._channelRepository);

  final TmdbRepository _tmdbRepository;
  final ChannelRepository _channelRepository;

  @override
  Future<Result<List<ContentModel>>> call(List<ChannelContentModel> request) {
    throw UnimplementedError();
  }

  // @override
  // Future<Result<List<ContentModel>>> call(List<ChannelContentModel> request) {
  // /* 1. Channel >  [contents]  > type & contentId 정보 확인 */
  // // `content Id`로 컨텐츠 정보 호출
  // request.map((e) {
  //   if (e.type == "movie") {
  //     final response =
  //         _tmdbRepository.loadMovieDetailInfo(int.parse(e.contentId));
  //   } else {
  //     // tv(darama)
  //   }
  // });
  // }
}
