import 'package:movie_curation/utilities/index.dart';
import 'package:movie_curation/utilities/responsive_size.dart';
import 'package:movie_curation/widgets/horizon_wheel_slider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreenT extends StatefulWidget {
  const HomeScreenT({Key? key}) : super(key: key);
  @override
  State<HomeScreenT> createState() => _HomeScreenTState();
}

int _selectedCategoryIndex = 0;
final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

class _HomeScreenTState extends State<HomeScreenT>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print(4.25.h);
    List<String> _categoryOptions = ["인기", "최신", "추천"];

    return Stack(children: [
      /* Content Image Background  (Image & Gradient Linear Background) */
      Stack(
        children: [
          Image.asset(
            "assets/images/movie_poster.jpeg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  kDarkGrey,
                  kDarkGrey.withOpacity(0.95),
                  kDarkGrey.withOpacity(0.9),
                  kDarkGrey.withOpacity(0.7),
                  kDarkGrey.withOpacity(0.5),
                  kDarkGrey.withOpacity(0.4),
                ],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.only(
            top: contentTopP, left: contentLeftP, bottom: contentBottomP),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Category Group Button */
            SizedBox(
              height:
                  groupButtonH, // TODO : RESPONSIVE WRP SIZE, 기기 별 대응하지 않으면 다른 방법 찾아야됨 (확인필요)
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _categoryOptions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: groupButtonRP),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                      child: Text(
                        _categoryOptions[index],
                        style: TextStyle(
                            color: Colors.white.withOpacity(
                                _selectedCategoryIndex == index ? 1 : 0.24),
                            fontSize: groupButtonTextSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
            /* Movie Content Info */
            Wrap(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: 58), //TODO : 나중에 레이아웃을 확인하고 Responsive Size로 변경 필요
                  height: contentResponsiveH,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* Title */
                      Text(
                        "더 스타 이즈 본",
                        style: FontStyles().movieTitle,
                      ),
                      /* GRated & Release Year */
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: kLightGrey,
                            ),
                            child: Text(
                              "C18",
                              style: FontStyles().gRated,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Text(
                            "2018",
                            style: FontStyles().releaseY,
                          ),
                        ],
                      ),
                      /* Description */
                      Container(
                        width: contentResponsiveW,
                        child: Text(
                          "음악가는 젊은 가수가 명성을 얻도록 돕고 알코올 중독은 자신의 경력을 내리막길로 몰아갑니다.",
                          style: FontStyles().description,
                        ),
                      ),
                      const SizedBox(),
                      /* Intent Buttons */
                      Container(
                        width: contentResponsiveW,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: kYellow,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset("assets/icons/play_ic.svg",
                                      color: Colors.black),
                                  const SizedBox(width: 6),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                      "컨텐츠",
                                      style: FontStyles().watchButton,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Wrap(
                              children: [
                                GradientButton(content: "예고편"),
                                const SizedBox(width: 12),
                                GradientButton(content: "추가"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /* Movie List Carousel Slider */
            Expanded(
              child: ScrollablePositionedList.builder(
                padding: EdgeInsets.only(top: contentSliderDivideP),
                itemCount: 10,
                initialScrollIndex: 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ValueListenableBuilder<Iterable<ItemPosition>>(
                    valueListenable: itemPositionsListener.itemPositions,
                    builder: (context, positions, child) {
                      return GestureDetector(
                        onTap: () {
                          itemScrollController.scrollTo(
                              index: index,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInOutCubic);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 32,
                          ),
                          color: Colors.yellow,
                          child: AspectRatio(
                            aspectRatio: 39 / 58,
                          ),
                        ),
                      );
                    },
                  );
                },
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}

// SizedBox(
// height: 400,
// child: HorizonWheelSlider.useDelegate(
// scrollDirection: Axis.horizontal,
// itemExtent: 290,
// diameterRatio: 200.0,
// childDelegate: ListWheelChildBuilderDelegate(
// builder: (BuildContext context, int index) {
// return Container(
// height: 290,
// width: 196,
// color: Colors.red,
// margin: EdgeInsets.only(right: 32),
// child: Center(
// child: Text("$index"),
// ),
// );
// }),
// ),
// )
