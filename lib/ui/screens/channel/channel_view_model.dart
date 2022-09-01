import 'package:movie_curation/domain/models/channel/channel_info_model.dart';
import 'package:movie_curation/domain/useCase/channel/load_channel_info_list_use_case.dart';
import 'package:movie_curation/utilities/index.dart';

class ChannelViewModel extends BaseViewModel {
  ChannelViewModel(this._loadChannelInfoList);

  /* 전역 변수 및 객체 */
  final Rxn<List<ChannelInfoModel>> _channelInfoList = Rxn();

  /* Usecase */
  final LoadChannelInfoListUseCase _loadChannelInfoList;

  /* Intent */

  @override
  void onInit() async {
    super.onInit();
  }

  /* Getters */
  List<ChannelInfoModel>? get channelInfoList => _channelInfoList.value;
}
