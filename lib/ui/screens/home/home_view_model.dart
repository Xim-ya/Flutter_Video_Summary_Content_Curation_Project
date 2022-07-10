import 'package:movie_curation/domain/models/content/content_cast_model.dart';
import 'package:movie_curation/domain/models/youtube/youtube_search_list_model.dart';
import 'package:movie_curation/domain/useCase/api/youtube_load_search_list_use_case.dart';
import 'package:movie_curation/utilities/index.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(this._loadPopularMovies, this.loadMovieTrailerKey,
      this._loadMovieCasts, this._loadDramaCasts, this._loadYoutubeSearchList);

  /* 전역변수 및 객체 */
  final Rxn<List<ContentModel>> _popularMovieList = Rxn();
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

  /* Usecase */
  final LoadPopularMoviesUseCase _loadPopularMovies;
  final TmdbLoadMovieTrailerKeyUseCase loadMovieTrailerKey;
  final TmdbLoadMovieCastsUseCase _loadMovieCasts;
  final TmdbLoadDramaCastsUseCase _loadDramaCasts;
  final YoutubeLoadSearchListUseCase _loadYoutubeSearchList;

  /* 메소드 */
  // 카테고리 그룹 버튼을 탭 되었을 때
  void onGroupBtnTap(int index) {
    selectedCategoryIndex.value = index;
  }

  // 콘텐츠가 선택 되었을 때
  void contentSelectHandler(int index) {
    selectedContentIndex.value = index;
  }

  void getContentGenre() {
    List<int> genreIdList = selectedMovieContent!.genreIds!.toList();
    _contentGenreList =
        genreIdList.map((e) => genreDefaults[e]).cast<String>().toList();
  }

  Future<void> showMovieTrailer() async {
    final int contentId = selectedMovieContent!.id.toInt();
    final trailerKey = await loadMovieTrailerKey.call(contentId);
    _trailerKey = trailerKey?.obs;
    Get.dialog(MovieTrailerDialog(
        controller: _trailerYoutubeController,
        hasTrailerKey: trailerKey == null ? false : true));
  }

  /* 네트워킹 메소드 */
  // 인기 영화 리스트 호출
  Future<void> loadPopularMovieList() async {
    loading(true);
    final responseResult = await _loadPopularMovies.call();
    responseResult.fold(onSuccess: (data) {
      _popularMovieList.value = data;
      loading(false);
    }, onFailure: (error) {
      print(error);
    });
  }

  // 영화 캐스트 정보 호출
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
    final responseResult = await _loadYoutubeSearchList.call("닥터 스트레인지");
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
  }

  /* 캡술화 - (Getter) */
  List<ContentModel>? get popularMovieList => _popularMovieList.value;
  List<ContentCastModel>? get contentCastList => _contentCastList.value;
  List<YoutubeSearchListItemModel>? get youtubeSearchList =>
      _youtubeSearchList.value;
  ContentModel? get selectedMovieContent =>
      _popularMovieList.value?[selectedContentIndex.value];
  List<String>? get contentGenreList => _contentGenreList;
}
