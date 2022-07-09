import 'package:movie_curation/utilities/index.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(this.loadPopularMovies, this.loadMovieTrailerKey);

  /* 전역변수 및 객체 */
  final Rxn<List<ContentModel>> _popularMovieList = Rxn();
  RxString? _trailerKey;

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
  final LoadPopularMoviesUseCase loadPopularMovies;
  final LoadTmdbLoadMovieTrailerKey loadMovieTrailerKey;

  /* 메소드 */

  // 카테고리 그룹 버튼을 탭 되었을 때
  void onGroupBtnTap(int index) {
    selectedCategoryIndex.value = index;
  }

  // 콘텐츠가 선택 되었을 때
  void contentSelectHandler(int index) {
    selectedContentIndex.value = index;
  }

  Future<void> showMovieTrailer() async {
    final int contentId = selectedMovieContent!.id.toInt();
    final trailerKey = await loadMovieTrailerKey.call(contentId);
    _trailerKey = trailerKey?.obs;
    Get.dialog(MovieTrailerDialog(
        controller: _trailerYoutubeController,
        hasTrailerKey: trailerKey == null ? false : true));
  }

  Future<void> getMovieContentId() async {
    final contentId = selectedMovieContent!.id;
  }

  /* 네트워킹 메소드 */
  // 인기 영화 리스트 호출
  Future<void> loadPopularMovieList() async {
    loading(true);
    final responseResult = await loadPopularMovies.call();
    responseResult.fold(onSuccess: (data) {
      _popularMovieList.value = data;
      loading(false);
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
  ContentModel? get selectedMovieContent =>
      _popularMovieList.value?[selectedContentIndex.value];
}
