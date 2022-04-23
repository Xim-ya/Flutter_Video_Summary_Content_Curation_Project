import 'package:movie_curation/utilities/index.dart';

class SearchVM extends GetxController {
  int selectedGenre = 0;

  // 선택된 장르 변경
  void setSelectedGenre(int index) {
    selectedGenre = index;
    update();
  }
}
