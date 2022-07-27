import 'package:movie_curation/domain/useCase/youtube/youtube_load_youtube_meta_data_ues_case.dart';
import 'package:movie_curation/utilities/index.dart';

class ContentDetailViewModel extends BaseViewModel {
  ContentDetailViewModel(this._loadYoutubeSearchList, this._loadMovieCasts,
      this._loadYoutubeMetaDataListUseCase);

  /* 전역변수 및 객체 */
  final Rxn<List<YoutubeVideoContentModel>> _youtubeSearchList = Rxn();
  final Rxn<List<ContentCastModel>> _contentCastList = Rxn();
  late List<String>? _contentGenreList;

  /* 컨트롤러 */
  late ScrollController _scrollController;

  /* Usecase */
  final YoutubeLoadSearchListUseCase _loadYoutubeSearchList;
  final TmdbLoadMovieCastsUseCase _loadMovieCasts;
  final LoadYoutubeMetaDataListUseCase _loadYoutubeMetaDataListUseCase;

  /* 컨트롤러 */
  //Youtube Player Controller - (예고편)
  YoutubePlayerController get _trailerYoutubeController {
    return YoutubePlayerController(
      initialVideoId: HomeViewModel.trailerKey ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
  }

  /* 메소드 */
  // 예고편 다이어로 위젯 띄우기
  Future<void> showContentTrailer() async {
    Get.dialog(MovieTrailerDialog(
        controller: _trailerYoutubeController,
        hasTrailerKey: HomeViewModel.trailerKey == null ? false : true));
  }

  /* 네트워킹 메소드 */
  // 유튜브 '리뷰' 컨텐츠 검색 정보 호출
  Future<void> loadYoutubeSearchList() async {
    // 조건 : 관리자에 의해 등록된 컨텐츠라면
    if (selectedContent?.youtubeVideoIds == null) {
      // 실행 : Youtube/SEARCH API를 콜.(컨텐츠 제목 기준)
      final responseResult =
          await _loadYoutubeSearchList.call(selectedContent!.title);
      responseResult.fold(onSuccess: (data) {
        _youtubeSearchList.value = data;
      }, onFailure: (error) {
        print(error);
      });
    } else {
      // 실행 : 등록된 컨텐츠
      final responseResult = await _loadYoutubeMetaDataListUseCase
          .call(selectedContent!.youtubeVideoIds!);
      responseResult.fold(onSuccess: (data) {
        _youtubeSearchList.value = data;
      }, onFailure: (error) {
        print(error);
      });
    }
  }

  // 영화 [캐스트] 정보 호출
  Future<void> loadMovieCastList() async {
    final responseResult =
        await _loadMovieCasts.call(selectedContent!.id as int);
    responseResult.fold(onSuccess: (data) {
      _contentCastList.value = data;
    }, onFailure: (error) {
      print(error);
    });
  }

  // 선택된 컨텐츠의 [장르] 정보 호출
  void getContentGenre() {
    List<int> genreIdList = selectedContent!.genreIds!.toList();
    final filteredGenreList = genreIdList.map((e) => genreDefaults[e]);
    _contentGenreList =
        filteredGenreList.map((e) => e ?? "확인 필요 장르").cast<String>().toList();
  }

  @override
  void onInit() {
    super.onInit();
    // 비동기 처리 X
    loadYoutubeSearchList();
    loadMovieCastList();
    getContentGenre();
    _scrollController = ScrollController(initialScrollOffset: kWS200);
  }

  /* 캡슐화 - (Getter) */
  ContentModel? get selectedContent => HomeViewModel.selectedContentG;
  List<ContentCastModel>? get contentCastList => _contentCastList.value;
  List<String>? get contentGenreList => _contentGenreList;
  List<YoutubeVideoContentModel>? get youtubeSearchList =>
      _youtubeSearchList.value;
  ScrollController get wheelScrollController => _scrollController;
}
