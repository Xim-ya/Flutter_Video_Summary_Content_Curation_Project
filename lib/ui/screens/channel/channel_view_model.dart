import 'dart:developer';
import 'package:movie_curation/domain/models/channel/channel_model.dart';
import 'package:movie_curation/domain/useCase/channel/load_channel_list_use_case.dart';
import 'package:movie_curation/utilities/index.dart';

class ChannelViewModel extends BaseViewModel {
  ChannelViewModel(this._loadChannelInfoList);

  /* 전역 변수 및 객체 */
  /// Data Variables
  final Rxn<List<ChannelModel>> _channelInfoList = Rxn();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// State Variables
  final RxInt _selectedChannelIndex = 0.obs;

  /* 컨트롤러 */
  // ItemScrollController & Listener - (Horizontal Post Slider )
  late final ItemScrollController _itemScrollController;
  late final ItemPositionsListener _itemPositionsListener;

  /* Usecase */
  final LoadChannelListUseCase _loadChannelInfoList;

  /* Intent */
  /// 네트워킹
  // 채널정보 리스트 호출
  Future<void> _fetchChannelInfo() async {
    final response = await _loadChannelInfoList.call();
    response.fold(onSuccess: (data) {
      _channelInfoList.value = data;
    }, onFailure: (err) {
      log(err.toString());
    });
  }

  // 네트워크
  Future<void> openDrawer() async {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  // 포스트 슬라이더에서 포스트 아이템에 선택 되었을 때
  void onPosterItemTapped(index) {
    // Scroll to Index 인터렉션
    _itemScrollController.scrollTo(
        index: index,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic);

    // selectedMovieIndex 설정
    // contentSelectHandler(index);
  }

  @override
  void onInit() async {
    super.onInit();

    _fetchChannelInfo();
    _itemScrollController = ItemScrollController();
    _itemPositionsListener = ItemPositionsListener.create();
  }

  /* Getters - (캡슐화)*/
  List<ChannelModel>? get channelInfoList => _channelInfoList.value;
  ChannelModel? get selectedChannel =>
      _channelInfoList.value?[_selectedChannelIndex.value];

  /// 컨트롤러
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  ItemScrollController get itemScrollController => _itemScrollController;
  ItemPositionsListener get itemPositionListener => _itemPositionsListener;
}
