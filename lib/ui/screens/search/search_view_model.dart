import 'dart:developer';
import 'package:movie_curation/domain/useCase/tmdb/load_movie_searched_list_use_case.dart';
import 'package:movie_curation/utilities/index.dart';

class SearchViewModel extends BaseViewModel {
  SearchViewModel(this._loadMovieListByGenre, this._loadMovieSearchedList);

  /* 전역변수 및 객체 */
  // State Variables
  final RxInt _selectedGenreKey = 16.obs; // 선택된 장르 키 값
  final RxInt _selectedContentIndex = 0.obs; // 장르 컨텐츠 리스트 인덱스
  final Rxn<List<ContentModel>>? _selectedContentList = Rxn();

  /* UseCase -(핵심 비즈니스 로직) */
  final LoadMovieListByGenreUseCase _loadMovieListByGenre;
  final LoadMovieSearchedListUseCase _loadMovieSearchedList;

  /* 컨트롤러 */
  late final PagingController<int, ContentModel> pagingController;
  late final TextEditingController textEditingController;

  /* 메소드 */

  // 검색되었을 때
  void onSearchInputChanged(String input) {
    log(input);
  }

  Future<void> onSearchInputSubmitted(String input) async {
    print('query -->${input}');
    final responseResult = await _loadMovieSearchedList(input);
    responseResult.fold(onSuccess: (data) {
      print("테스트1 ==> ${data[1].title}");
      print("테스트2 ==> ${data.length}");
    }, onFailure: (err) {
      log(err.toString());
    });
  }

  // 장르버튼이 클릭 되었을 때
  void onGenreBtnTapped(int genreKey) {
    _selectedContentList!.value = null;
    _selectedGenreKey.value = genreKey;
    pagingController.refresh();
    // onInitialLoadingContentList();
  }

  // 컨텐츠 리스트 아이템이 클릭 되었을 때
  Future<void> onContentItemTapped(int index) async {
    _selectedContentIndex.value = index;
  }

  // 컨텐츠 리스트 호출 - (pagination logic 적용)
  Future<void> loadContentListByPaging() async {
    loading(true);
    final responseResult = await _loadMovieListByGenre(
        _selectedGenreKey.value, pagingController.nextPageKey!);
    responseResult.fold(onSuccess: (data) {
      _selectedContentList!.value = data;
      // 최대 불러올 수 있는 page 넘버를 2로 설정 (컨텐츠 40개) - TMDB 기준
      // 호출한 데이터가 20개 이하면 더 이상 불러올 수 없다고 판단.
      final bool limitPage = pagingController.nextPageKey! > 1;
      final bool noMoreReturn = data.length < 20;
      if (limitPage || noMoreReturn) {
        log('[Paging]last load');
        pagingController.appendLastPage(data);
      } else {
        log('[Paging]first load');
        pagingController.appendPage(data, pagingController.nextPageKey! + 1);
      }
    }, onFailure: (err) {
      pagingController.error = err;
    });

    loading(false);
  }

  @override
  void onInit() {
    super.onInit();
    pagingController = PagingController(
        firstPageKey: 1, invisibleItemsThreshold: 1); // paging controller 생성
    // paging 컨트럴러 listener 설정
    pagingController.addPageRequestListener((pageKey) {
      loadContentListByPaging();
    });
    textEditingController = TextEditingController();
  }

  /* Getter - (캡슐화) */
  int get selectedGenreKey => _selectedGenreKey.value;
  int get selectedContentIndex => _selectedContentIndex.value;
  ContentModel? get selectedContent =>
      _selectedContentList!.value![_selectedContentIndex.value];
  static ContentModel? get selectedContentG =>
      Get.find<SearchViewModel>().selectedContent;

  List<ContentModel>? get selectedContentList => _selectedContentList!.value;
}
