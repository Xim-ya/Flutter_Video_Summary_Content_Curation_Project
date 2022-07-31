import 'package:movie_curation/utilities/index.dart';

class SearchViewModel extends BaseViewModel {
  /* 전역변수 및 객체 */
  final RxInt _selectedGenreKey = 3210.obs; // 선택된 장르

  /* 컨트롤러 */
  late final ScrollController _scrollController;

  /* 메소드 */
  // 장르버튼이 클릭 되었을 때
  void onGenreBtnTapped(int genreKey) {
    _selectedGenreKey.value = genreKey;
  }

  @override
  void onInit() {
    _scrollController = ScrollController();
    super.onInit();
  }

  /* Getter - (캡슐화) */

  int get selectedGenreKey => _selectedGenreKey.value;
  ScrollController get verticalScrollController => _scrollController;
  // List<ContentModel>? get selectedContentList =>
}
