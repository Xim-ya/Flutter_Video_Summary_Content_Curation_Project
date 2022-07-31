import 'package:movie_curation/domain/useCase/tmdb/load_movie_list_by_genre_use_case.dart';
import 'package:movie_curation/utilities/index.dart';

class SearchViewModel extends BaseViewModel {
  SearchViewModel(this._loadMovieListByGenre);

  /* 전역변수 및 객체 */
  final RxInt _selectedGenreKey = 3210.obs; // 선택된 장르
  final Rxn<List<ContentModel>>? _selectedContentList = Rxn();

  /* UseCase -(핵심 비즈니스 로직) */
  final LoadMovieListByGenreUseCase _loadMovieListByGenre;

  /* 컨트롤러 */
  late final ScrollController _scrollController;

  /* 메소드 */
  // 장르버튼이 클릭 되었을 때
  void onGenreBtnTapped(int genreKey) {
    _selectedGenreKey.value = genreKey;
    loadContentList();
    print("aim");
  }

  Future<void> loadContentList() async {
    final responseResult =
        await _loadMovieListByGenre.call(_selectedGenreKey.value);
    responseResult.fold(onSuccess: (data) {
      _selectedContentList!.value = data;
    }, onFailure: (e) {
      print(e);
    });
  }

  @override
  void onInit() {
    _scrollController = ScrollController();
    loadContentList();
    super.onInit();
  }

  /* Getter - (캡슐화) */
  int get selectedGenreKey => _selectedGenreKey.value;
  List<ContentModel>? get selectedContentList => _selectedContentList!.value;
  ScrollController get verticalScrollController => _scrollController;
}
