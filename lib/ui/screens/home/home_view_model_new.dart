import 'package:movie_curation/domain/models/tmdb/tmdb_movie_content_model.dart';
import 'package:movie_curation/domain/useCase/tmdb/tmdb_load_popular_movies_use_case.dart';
import 'package:movie_curation/ui/common/base/base_view_model.dart';
import 'package:movie_curation/utilities/index.dart';

class HomeViewModelNew extends BaseViewModel {
  HomeViewModelNew(this.loadPopularMovies);

  /* 전역변수 및 객체 */
  final Rxn<List<TmdbMovieContentModel>> _popularMovieList = Rxn();
  RxInt selectedCategoryIndex = 0.obs; // [인기, 최신, 추천] 카테고리 옵션

  /* Usecase 메소드 */
  final LoadPopularMoviesUseCase loadPopularMovies;

  /* 메소드 */
  // 카테고리 그룹 버튼을 탭 되었을 때
  void onGroupBtnTap(int index) {
    selectedCategoryIndex.value = index;
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
  List<TmdbMovieContentModel>? get popularMovieList => _popularMovieList.value;
}
