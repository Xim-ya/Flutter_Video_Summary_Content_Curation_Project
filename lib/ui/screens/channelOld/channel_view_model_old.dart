import 'dart:developer';

import 'package:movie_curation/domain/models/channel/channel_model.dart';
import 'package:movie_curation/domain/useCase/channel/load_channel_list_use_case.dart';
import 'package:movie_curation/utilities/index.dart';

class ChannelViewModelOld extends BaseViewModel {
  ChannelViewModelOld(this._loadChannelInfoList);
  /* 전역 변수 및 객체 */
  final Rxn<List<ChannelModel>> _channelInfoList = Rxn();
  final RxInt _selectedChannelIndex = 0.obs;

  /* Controller*/
  final CarouselController swiperController = CarouselController();

  /* Usecase */
  final LoadChannelListUseCase _loadChannelInfoList;

  /* Intent */

  // 유튜브 채널 정보 리스트 호출
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

  // 유튜브 채널 리스트가 선택 클릭 되었을 때
  void onChannelLisItemTapped(index) {
    swiperController.jumpToPage(index);
    _selectedChannelIndex.value = index;
  }

  @override
  void onInit() async {
    super.onInit();

    _fetchChannelInfoList().whenComplete(() {
      print("${_channelInfoList.value!.length}");
    });
  }

  /* Getters */
  List<ChannelModel>? get channelInfoList => _channelInfoList.value;
  int get selectedChannelIndex => _selectedChannelIndex.value;
}
