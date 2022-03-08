import 'package:movie_curation/utilities/index.dart';
import 'package:movie_curation/widgets/category_group_button.dart';
import 'package:movie_curation/widgets/gradient_post_background.dart';
import 'package:movie_curation/widgets/movie_content_info.dart';
import 'package:movie_curation/widgets/movie_list_slider.dart';

class HomeScreenT extends StatefulWidget {
  const HomeScreenT({Key? key}) : super(key: key);
  @override
  State<HomeScreenT> createState() => _HomeScreenTState();
}

/* 터치 특정 슬라이더 아이템으로 이동하는 controller & listener  (부모 위젯에서 관리) */
final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();
final _movieVM = Get.put(MovieVM());

class _HomeScreenTState extends State<HomeScreenT>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieVM>(
        init: _movieVM,
        builder: (context) {
          return Stack(children: [
            /* Content Image Background  (Image & Gradient Linear Background) */
            GradientPostBackground(),
            Container(
              padding: EdgeInsets.only(
                  top: contentTopP, left: contentLeftP, bottom: contentBottomP),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* Category Group Button */
                  CategoryGroupButton(movieVM: _movieVM),
                  /* Movie Content Info */
                  MovieContentInfo(),
                  /* Movie List Carousel Slider */
                  MovieListSlider()
                ],
              ),
            ),
          ]);
        });
  }

  @override
  bool get wantKeepAlive => true;
}
