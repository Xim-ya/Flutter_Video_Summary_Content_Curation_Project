import 'package:movie_curation/utilities/index.dart';

class ContentDetailViewModel extends BaseViewModel {
  ContentDetailViewModel(this._loadYoutubeSearchList, this._loadMovieCasts);

  /* 전역변수 및 객체 */
  final Rxn<List<YoutubeSearchListItemModel>> _youtubeSearchList = Rxn();
  final Rxn<List<ContentCastModel>> _contentCastList = Rxn();
  late List<String>? _contentGenreList;

  /* 컨트롤러 */
  late ScrollController _scrollController;

  /* Usecase */
  final YoutubeLoadSearchListUseCase _loadYoutubeSearchList;
  final TmdbLoadMovieCastsUseCase _loadMovieCasts;

  /* 네트워킹 메소드 */
  // 유튜브 '리뷰' 컨텐츠 검색 정보 호출
  Future<void> loadYoutubeSearchList() async {
    final responseResult =
        await _loadYoutubeSearchList.call(selectedContent!.title);
    responseResult.fold(onSuccess: (data) {
      _youtubeSearchList.value = data;
    }, onFailure: (error) {
      print(error);
    });
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
  void onInit() async {
    super.onInit();
    loadMovieCastList();
    getContentGenre();
    loadYoutubeSearchList();
    _scrollController = ScrollController(initialScrollOffset: kWS200);
  }

  /* 캡슐화 - (Getter) */
  ContentModel? get selectedContent => HomeViewModel.selectedContentG;
  List<ContentCastModel>? get contentCastList => _contentCastList.value;
  List<String>? get contentGenreList => _contentGenreList;
  List<YoutubeSearchListItemModel>? get youtubeSearchList =>
      _youtubeSearchList.value;
  ScrollController get wheelScrollController => _scrollController;
}
