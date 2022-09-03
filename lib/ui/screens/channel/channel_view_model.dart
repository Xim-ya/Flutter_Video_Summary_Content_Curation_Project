import 'dart:developer';

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
  Future<void> _fetchChannelInfoList() async {
    final response = await _loadChannelInfoList();
    response.fold(
      onSuccess: (data) {
        _channelInfoList.value = data;
      },
      onFailure: (err) {
        log(err.toString());
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();

    _fetchChannelInfoList().whenComplete(() {
      print("${_channelInfoList.value!.length}");
    });
  }

  /* Getters */
  List<ChannelInfoModel>? get channelInfoList => _channelInfoList.value;
}
