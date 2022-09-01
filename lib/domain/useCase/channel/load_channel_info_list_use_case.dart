import 'package:movie_curation/data/repository/channel/channel_repository.dart';
import 'package:movie_curation/domain/models/channel/channel_info_model.dart';
import 'package:movie_curation/utilities/index.dart';

class LoadChannelInfoListUseCase
    extends BaseNoParamUseCase<Result<List<ChannelInfoModel>>> {
  final ChannelRepository _repository;

  LoadChannelInfoListUseCase(this._repository);

  @override
  Future<Result<List<ChannelInfoModel>>> call() {
    return _repository.loadChannelInfoList();
  }
}
