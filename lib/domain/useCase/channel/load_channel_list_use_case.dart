import 'package:movie_curation/data/repository/channel/channel_repository.dart';
import 'package:movie_curation/domain/models/channel/channel_model.dart';
import 'package:movie_curation/utilities/index.dart';

class LoadChannelListUseCase
    extends BaseNoParamUseCase<Result<List<ChannelModel>>> {
  final ChannelRepository _repository;

  LoadChannelListUseCase(this._repository);

  @override
  Future<Result<List<ChannelModel>>> call() {
    return _repository.loadChannelInfoList();
  }
}
