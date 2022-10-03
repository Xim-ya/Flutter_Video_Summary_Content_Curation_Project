import 'package:movie_curation/domain/models/channel/channel_model.dart';
import 'package:movie_curation/utilities/index.dart';

abstract class ChannelRepository {
  Future<Result<List<ChannelModel>>> loadChannelInfoList();
}
