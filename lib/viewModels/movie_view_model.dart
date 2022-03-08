import 'package:movie_curation/utilities/index.dart';

class MovieVM extends GetxController {
  int selectedCategoryIndex = 0;

  void updateCategoryIndex(int index) {
    selectedCategoryIndex = index;
    update();
  }
}
