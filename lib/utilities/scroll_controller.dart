import 'package:movie_curation/utilities/index.dart';

/* 터치 특정 슬라이더 아이템으로 이동하는 controller & listener */
// HomeScreen(부모 위젯에서 관리) > MoviePostSlider

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();
