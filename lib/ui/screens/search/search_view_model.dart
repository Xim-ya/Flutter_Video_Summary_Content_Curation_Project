import 'dart:developer';
import 'package:movie_curation/domain/useCase/content/load_registered_content_id_info_use_case.dart';
import 'package:movie_curation/domain/useCase/content/load_registered_content_youtube_info.dart';
import 'package:movie_curation/utilities/index.dart';

class SearchViewModel extends BaseViewModel {
  SearchViewModel(
      this._loadMovieListByGenre,
      this._loadMovieSearchedList,
      this._loadSimilarMovieList,
      this._loadRegisteredContentYoutubeInfo,
      this._loadRegisteredContentIdInfo);

  /* 전역변수 및 객체 */
  // Basic Mode Variables
  final RxInt _selectedGenreKey = 16.obs; // 선택된 장르 키 값
  final RxInt _selectedContentIndex = 0.obs; // 선택된 장르 컨텐츠 리스트 인덱스
  final RxBool _selectedContentIsRegistered =
      false.obs; // 선택된 컨텐츠 firebaseDB에 등록되어 있는지에 대한 여부
  final Rxn<ContentRegisteredIdInfoModel> _selectedRegisteredIdInfo =
      Rxn(); // Firebase DB에 저장되어 있는 컨텐츠의 등록정보
  final Rxn<List<YoutubeVideoContentModel>> _registeredYoutubeVideoList = Rxn();

  // Search Mode Variables
  RxBool isSearchMode = false.obs; // 검색로직 활성화 여부
  RxBool isSearchLoading = false.obs;
  final Rxn<List<ContentModel>>? _contentSearchList = Rxn();
  final RxnInt _selectedSearchContentIndex = RxnInt(); //선택된 검색 결과 리스트 인덱스
  final Rxn<List<ContentModel>>? _similarContentList = Rxn();
  final Rxn<List<ContentModel>>? _searchAndSimilarContentList = Rxn();

  /* UseCase -(비즈니스 로직 / 네트워킹 메소드) */
  final LoadMovieListByGenreUseCase _loadMovieListByGenre;
  final LoadMovieSearchedListUseCase _loadMovieSearchedList;
  final LoadSimilarMovieListUseCase _loadSimilarMovieList;
  final LoadRegisteredContentYoutubeInfo _loadRegisteredContentYoutubeInfo;
  final LoadRegisteredContentIdInfoUseCase _loadRegisteredContentIdInfo;

  /* 컨트롤러 */
  late final PagingController<int, ContentModel> pagingController;
  late final TextEditingController textEditingController;

  /* 메소드 */

  // TextFiled에 검색 값이 입력 되었을 때
  void onSearchInputChanged(String input) {
    if (input.isNotEmpty) {
      if (_selectedSearchContentIndex.value != null) {
        _selectedSearchContentIndex.value = null;
      }
      loadMovieSearchList(input);
    }

    if (isSearchMode.isTrue && input.isNotEmpty) return;
    if (isSearchMode.isFalse && input.isEmpty) return;

    if (input.isNotEmpty) {
      isSearchMode(true);
      log("ON SEARCH MODE");
    } else {
      isSearchMode(false);
      _selectedSearchContentIndex.value = null;
      log("DISPOSE SEARCH MODE");
    }
  }

  // TextFiled 값이 Sumbit 되었을 때
  Future<void> onSearchInputSubmitted(String input) async {
    final responseResult = await _loadMovieSearchedList(input);
    responseResult.fold(
        onSuccess: (data) {},
        onFailure: (err) {
          log(err.toString());
        });
  }

  // 검색된 영화 리스트 호출
  Future<void> loadMovieSearchList(String input) async {
    isSearchLoading(true);
    final responseResult = await _loadMovieSearchedList(input);
    responseResult.fold(onSuccess: (data) {
      _contentSearchList?.value = data;
    }, onFailure: (err) {
      log(err.toString());
    });
    isSearchLoading(false);
  }

  // 장르버튼이 클릭 되었을 때
  void onGenreBtnTapped(int genreKey) {
    _selectedGenreKey.value = genreKey;
    pagingController.refresh();
    // onInitialLoadingContentList();
  }

  // 컨텐츠 리스트 아이템이 클릭 되었을 때
  Future<void> onContentItemTapped(int? index) async {
    if (index == null) return;
    _selectedContentIndex.value = index;
  }

  // 검색 결과 리스트 아이템이 클릭 되었을 때
  Future<void> onAutoCompleteResultTapped(int index) async {
    _searchAndSimilarContentList?.value = null; // reset
    _selectedSearchContentIndex.value = index;
    ContentModel selectedSearchContent = _contentSearchList!.value![index];
    await loadSimilarContentList(contentSearchList![index].id as int)
        .whenComplete(() {
      // 두 개의 리스트를 Merge
      _searchAndSimilarContentList?.value = [
        selectedSearchContent,
        ...?_similarContentList?.value
      ];
    });
  }

  // 검색 결과에서 선택된 컨텐츠 + 유사 컨텐츠 리스트 아이템이 선택되었을 때
  Future<void> searchAndSimilarContentTapped(int index) async {
    _selectedSearchContentIndex.value = index;
  }

  // 유사 영화 컨텐츠 리스트 호출
  Future<void> loadSimilarContentList(int movieId) async {
    final responseResult = await _loadSimilarMovieList(movieId);
    responseResult.fold(onSuccess: (data) {
      _similarContentList?.value = data;
      log("유사 영화 호출됨! ${_similarContentList!.value!.length}");
    }, onFailure: (err) {
      log(err.toString());
    });
  }

  // 컨텐츠 리스트 호출 - (pagination logic 적용)
  Future<void> loadContentListByPaging() async {
    loading(true);
    final responseResult = await _loadMovieListByGenre(
        _selectedGenreKey.value, pagingController.nextPageKey!);
    responseResult.fold(onSuccess: (data) {
      // 최대 불러올 수 있는 page 넘버를 2로 설정 (컨텐츠 40개) - TMDB 기준
      // 호출한 데이터가 20개 이하면 더 이상 불러올 수 없다고 판단.
      final bool limitPage = pagingController.nextPageKey! > 1;
      final bool noMoreReturn = data.length < 20;
      if (limitPage || noMoreReturn) {
        log('[PAGING] LAST LOAD');
        pagingController.appendLastPage(data);
      } else {
        log('[PAGING] FIRST LOAD');
        pagingController.appendPage(data, pagingController.nextPageKey! + 1);
      }
    }, onFailure: (err) {
      pagingController.error = err;
    });

    loading(false);
  }

  Future<void> checkIfContentIsRegistered(int contentId) async {
    final responseResult = await _loadRegisteredContentIdInfo.call(contentId);
    responseResult.fold(onSuccess: (data) {
      _selectedRegisteredIdInfo.value = data;
      _selectedContentIsRegistered.value = true;
    }, onFailure: (err) {
      log(err.toString());
    });
  }

  Future<void> loadYoutubeInfoList() async {
    // 조건 : 컨텐츠 등록된 컨텐츠라면
    if (_selectedRegisteredIdInfo.value != null) {
      // 실행 : 유튜브 정보 리스트를 호출
      final responseResult = await _loadRegisteredContentYoutubeInfo
          .call(_selectedRegisteredIdInfo.value!);
      responseResult.fold(onSuccess: (data) {
        _registeredYoutubeVideoList.value = data;
      }, onFailure: (err) {
        log(err.toString());
      });
    } else {
      // 조건 : 등록된 컨텐츠가 아니라면 리턴
      return;
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadYoutubeInfoList();
    pagingController = PagingController(
        firstPageKey: 1, invisibleItemsThreshold: 1); // paging controller 생성
    // paging 컨트럴러 listener 설정
    pagingController.addPageRequestListener((pageKey) {
      loadContentListByPaging();
    });
    textEditingController = TextEditingController();
  }

  /* Getter - (캡슐화) */
  // Basic Mode Getters
  int get selectedGenreKey => _selectedGenreKey.value;

  // Search Mode Getters
  int? get selectedSearchContentIndex => _selectedSearchContentIndex.value;
  List<ContentModel>? get contentSearchList => _contentSearchList?.value;
  List<ContentModel>? get searchAndSimilarContentList =>
      _searchAndSimilarContentList?.value;
  ContentModel? get selectedSearchContent =>
      _contentSearchList?.value?[_selectedSearchContentIndex.value!];
  RxBool get showGenreContentList =>
      RxBool(selectedSearchContentIndex == null ? true : false);
  List<ContentModel>? get similarContentList => _similarContentList?.value;

  // Integrated Mode Getters
  int get selectedContentIndex => isSearchMode.isTrue
      ? _selectedSearchContentIndex.value!
      : _selectedContentIndex.value;
  ContentModel? get selectedContent => isSearchMode.isTrue
      ? _searchAndSimilarContentList?.value![selectedSearchContentIndex!]
      : pagingController.itemList?[_selectedContentIndex.value];

  static ContentModel? get selectedContentG =>
      Get.find<SearchViewModel>().selectedContent;
  static bool get selectedContentIsRegisteredG =>
      Get.find<SearchViewModel>()._selectedContentIsRegistered.value;
  static Rxn<List<YoutubeVideoContentModel>> get customYoutubeVideoInfoListG =>
      Get.find<SearchViewModel>()._registeredYoutubeVideoList;
}
