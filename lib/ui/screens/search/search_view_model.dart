import 'package:movie_curation/domain/useCase/tmdb/load_movie_list_by_genre_use_case.dart';
import 'package:movie_curation/utilities/index.dart';

class SearchViewModel extends BaseViewModel {
  SearchViewModel(this._loadMovieListByGenre);

  /* 전역변수 및 객체 */
  // State Variables
  final RxInt _selectedGenreKey = 3210.obs; // 선택된 장르
  final RxInt _selectedContentIndex = 0.obs;
  final Rxn<List<ContentModel>>? _selectedContentList = Rxn();

  /* UseCase -(핵심 비즈니스 로직) */
  final LoadMovieListByGenreUseCase _loadMovieListByGenre;

  /* 컨트롤러 */
  late final ScrollController _scrollController;

  /* 메소드 */
  // 장르버튼이 클릭 되었을 때
  void onGenreBtnTapped(int genreKey) {
    _selectedGenreKey.value = genreKey;
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 440), curve: Curves.easeIn);
    loadContentList();
  }

  // 컨텐츠 리스트 아이템이 클릭 되었을 때
  void onContentItemTapped(int index) {
    _selectedContentIndex.value = index;
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
  int get selectedContentIndex => _selectedContentIndex.value;
  ContentModel? get selectedContent =>
      _selectedContentList!.value![_selectedContentIndex.value];
  static ContentModel? get selectedContentG =>
      Get.find<SearchViewModel>().selectedContent;

  List<ContentModel>? get selectedContentList => _selectedContentList!.value;
  ScrollController get verticalScrollController => _scrollController;

  // ContentModel? get selectedContent =>
  //     _selectedContentList?.value![_selectedContentIndex.value];
}
