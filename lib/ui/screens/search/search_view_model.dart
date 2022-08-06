import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_curation/utilities/index.dart';

class SearchViewModel extends BaseViewModel {
  SearchViewModel(this._loadMovieListByGenre);

  /* 전역변수 및 객체 */
  // State Variables
  final RxInt _selectedGenreKey = 28.obs; // 선택된 장르 키 값
  final RxInt _selectedContentIndex = 0.obs; // 장르 컨텐츠 리스트 인덱스
  final Rxn<List<ContentModel>>? _selectedContentList = Rxn();
  final int _pageSize = 20;
  int page = 1;
  bool firstLoaded = true;

  /* UseCase -(핵심 비즈니스 로직) */
  final LoadMovieListByGenreUseCase _loadMovieListByGenre;

  /* 컨트롤러 */
  // late final ScrollController _scrollController;
  late final PagingController<int, ContentModel> pagingController;

  /* 메소드 */
  // 장르버튼이 클릭 되었을 때
  void onGenreBtnTapped(int genreKey) {
    _selectedGenreKey.value = genreKey;
    pagingController.refresh();
    firstLoaded = false;
    pagingController.addPageRequestListener((pageKey) {
      loadContentList(1);
    });
    // onInitialLoadingContentList();
  }

  // 컨텐츠 리스트 아이템이 클릭 되었을 때
  void onContentItemTapped(int index) {
    _selectedContentIndex.value = index;
  }

  // Future<void> pagination() async {
  //   if ((_scrollController.position.pixels ==
  //           _scrollController.position.maxScrollExtent) &&
  //       (_selectedContentList!.length < total)) {
  //     // setState(() {
  //     //   isLoading = true;
  //     //   page += 1;
  //     //   //add api for load the more data according to new page
  //     // });
  //   }
  // }

  // Paging 기능
  Future<void> loadMoreContentList() async {
    loading(true);
    final responseResult =
        await _loadMovieListByGenre.call(_selectedGenreKey.value, 2);
    responseResult.fold(onSuccess: (data) {
      _selectedContentList!.value!.addAll(data);
    }, onFailure: (e) {
      print(e);
    });
    loading(false);
  }

  // Future<void> loadContentList(int page) async {
  //   loading(true);
  //   final responseResult =
  //       await _loadMovieListByGenre.call(_selectedGenreKey.value, page);
  //   responseResult.fold(onSuccess: (data) {
  //     _selectedContentList!.value = data;
  //   }, onFailure: (e) {
  //     print(e);
  //   });
  //   loading(false);
  // }

  Future<void> loadContentListByPaging() async {
    print("page key is --> ${pagingController.nextPageKey}");
    final responseResult = await _loadMovieListByGenre(
        _selectedGenreKey.value, pagingController.nextPageKey!);
    responseResult.fold(onSuccess: (data) {
      final bool isLastPage = pagingController.nextPageKey! > 1;
      print('nextPageKey = ${pagingController.nextPageKey}');
      print('${isLastPage}');
      if (isLastPage) {
        print("last load");
        pagingController.appendLastPage(data);
      } else {
        print('first laod');
        pagingController.appendPage(data, pagingController.nextPageKey! + 1);
      }

      firstLoaded = false;
    }, onFailure: (err) {
      pagingController.error = err;
    });
  }

  Future<void> loadContentList(int page) async {
    print("why this is loading?");
    // final responseResult = await _loadMovieListByGenre(
    //     _selectedGenreKey.value, pagingController.nextPageKey!);
    // responseResult.fold(onSuccess: (data) {
    //   final bool isLastPage = pagingController.nextPageKey! > 2;
    //   if (isLastPage) {
    //     print("last load");
    //     pagingController.appendLastPage(data);
    //   } else {
    //     print("keepLoading load");
    //     pagingController.appendPage(data, pagingController.nextPageKey);
    //   }
    // }, onFailure: (err) {
    //   pagingController.error = err;
    // });

    // update();
  }

  @override
  void onInit() {
    // _scrollController = ScrollController();
    // loadContentList(1);
    super.onInit();

    pagingController =
        PagingController(firstPageKey: 1, invisibleItemsThreshold: 1);

    pagingController.addPageRequestListener((pageKey) {
      loadContentListByPaging();
    });

    // onInitialLoadingContentList();
  }

  /* Getter - (캡슐화) */
  int get selectedGenreKey => _selectedGenreKey.value;
  int get selectedContentIndex => _selectedContentIndex.value;
  ContentModel? get selectedContent =>
      _selectedContentList!.value![_selectedContentIndex.value];
  static ContentModel? get selectedContentG =>
      Get.find<SearchViewModel>().selectedContent;

  List<ContentModel>? get selectedContentList => _selectedContentList!.value;
  // ScrollController get verticalScrollController => _scrollController;

  // ContentModel? get selectedContent =>
  //     _selectedContentList?.value![_selectedContentIndex.value];
}
