import 'package:movie_curation/utilities/index.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(
      this._loadPopularMovies,
      this.loadMovieTrailerKey,
      this._loadPopularDramas,
      this._loadMovieCasts,
      this._loadDramaCasts,
      this._loadPopularContentListUseCase,
      this._loadYoutubeSearchList);

  /* 전역변수 및 객체 */
  final Rxn<List<ContentModel>> _selectedContentList = Rxn();
  final Rxn<List<ContentCastModel>> _contentCastList = Rxn();
  final Rxn<List<YoutubeSearchListItemModel>> _youtubeSearchList = Rxn();
  RxString? _trailerKey;
  List<String>? _contentGenreList;

  // State Variables;
  RxInt selectedCategoryIndex = 0.obs; // [인기, 최신, 추천] 카테고리 옵션
  RxInt selectedContentIndex = 0.obs; // 홈 화면에서 선택된 컨텐츠의 인덱스

  // 컨트롤러 (Youtube Player Controller)
  YoutubePlayerController get _trailerYoutubeController {
    return YoutubePlayerController(
      initialVideoId: _trailerKey?.value ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
  }

  late final ScrollController _scrollController;

  /* Usecase */
  final LoadPopularMoviesUseCase _loadPopularMovies;
  final TmdbLoadPopularDramasUseCase _loadPopularDramas;
  final TmdbLoadMovieTrailerKeyUseCase loadMovieTrailerKey;
  final LoadPopularContentListUseCase _loadPopularContentListUseCase;
  final TmdbLoadMovieCastsUseCase _loadMovieCasts;
  final TmdbLoadDramaCastsUseCase _loadDramaCasts;
  final YoutubeLoadSearchListUseCase _loadYoutubeSearchList;

  /* 메소드 */
  // 카테고리 그룹 버튼을 탭 되었을 때
  void onCategoryBtnTap(int index) {
    if (selectedCategoryIndex.value == index)
      return; // 현재 카테고리가 다시 클릭 되었을 때는 해당 메소드 종료 (불필요 네트워크 호출 제거)
    selectedCategoryIndex.value = index; // 카테고리 변경
    loadPopularContentList();
  }

  // 콘텐츠가 선택 되었을 때
  void contentSelectHandler(int index) {
    selectedContentIndex.value = index;
  }

  // 선택된 컨텐츠의 [장르] 정보 호출
  void getContentGenre() {
    List<int> genreIdList = selectedMovieContent!.genreIds!.toList();
    final filteredGenreList = genreIdList.map((e) => genreDefaults[e]);
    _contentGenreList =
        filteredGenreList.map((e) => e ?? "확인 필요 장르").cast<String>().toList();
  }

  // 예고편 다이어로 위젯
  Future<void> showMovieTrailer() async {
    final int contentId = selectedMovieContent!.id.toInt();
    final trailerKey = await loadMovieTrailerKey.call(contentId);
    _trailerKey = trailerKey?.obs;
    Get.dialog(MovieTrailerDialog(
        controller: _trailerYoutubeController,
        hasTrailerKey: trailerKey == null ? false : true));
  }

  /* 네트워킹 메소드 */
  // 인기 [컨텐츠] 데이터 호출. (현재 선택된 카테고리 인덱스를 기준으로 호출)
  Future<void> loadPopularContentList() async {
    loading(true);
    final responseResult =
        await _loadPopularContentListUseCase.call(selectedCategoryIndex.value);
    responseResult.fold(onSuccess: (data) {
      _selectedContentList.value = data;
      loading(false);
    }, onFailure: (error) {
      print(error);
    });
  }

  // 인기 [영화] 리스트 호출
  Future<void> loadPopularMovieList() async {
    loading(true);
    final responseResult = await _loadPopularMovies.call();
    responseResult.fold(onSuccess: (data) {
      _selectedContentList.value = data;
      loading(false);
    }, onFailure: (error) {
      print(error);
    });
  }

  // 인기 [드라마] 리스트 호출
  Future<void> loadPopularDramaList() async {
    loading(true);
    final responseResult = await _loadPopularDramas.call();
    responseResult.fold(onSuccess: (data) {
      _selectedContentList.value = data;
      loading(false);
    }, onFailure: (error) {
      print(error);
    });
  }

  // 영화 [캐스트] 정보 호출
  Future<void> loadMovieCastList() async {
    final responseResult =
        await _loadMovieCasts.call(selectedMovieContent!.id as int);
    responseResult.fold(onSuccess: (data) {
      _contentCastList.value = data;
    }, onFailure: (error) {
      print(error);
    });
  }

  // 유튜브 '리뷰' 컨텐츠 검색 정보 호출
  Future<void> loadYoutubeSearchList() async {
    final responseResult =
        await _loadYoutubeSearchList.call(selectedMovieContent!.title);
    responseResult.fold(onSuccess: (data) {
      _youtubeSearchList.value = data;
    }, onFailure: (error) {
      print(error);
    });
  }

  @override
  void onInit() async {
    super.onInit();
    await loadPopularMovieList();
    _scrollController = ScrollController(initialScrollOffset: kWS200);
  }

  /* 캡술화 - (Getter) */
  List<ContentModel>? get popularMovieList => _selectedContentList.value;
  List<ContentCastModel>? get contentCastList => _contentCastList.value;
  List<YoutubeSearchListItemModel>? get youtubeSearchList =>
      _youtubeSearchList.value;
  ContentModel? get selectedMovieContent =>
      _selectedContentList.value?[selectedContentIndex.value];
  List<String>? get contentGenreList => _contentGenreList;
  ScrollController get wheelScrollController => _scrollController;
}
