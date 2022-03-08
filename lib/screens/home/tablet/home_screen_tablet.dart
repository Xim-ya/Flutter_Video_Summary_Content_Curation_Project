import 'package:flutter/material.dart';
import 'package:movie_curation/utilities/index.dart';
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
    List<String> _categoryOptions = ["인기", "최신", "추천"];
    double width = MediaQuery.of(context).size.width;
    print(7.59.sp);
    // 20,
    return Stack(children: [
      /* Content Image Background  (Image & Gradient Linear Background) */

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
      Container(
        padding: EdgeInsets.only(
            top: contentTopP, left: contentLeftP, bottom: contentBottomP),
        child: Column(
          children: [
            /* Category Group Button */
            Row(
                children: _categoryOptions.map<Widget>((e) {
              int _itemIndex =
                  _categoryOptions.indexWhere((content) => content == e);
              return Container(
                padding: const EdgeInsets.only(right: 8),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedCategoryIndex = _itemIndex;
                    });
                  },
                  child: Text(
                    e,
                    style: TextStyle(
                        color: Colors.white.withOpacity(
                            _selectedCategoryIndex == _itemIndex ? 1 : 0.24),
                        fontSize: groupButtonTextSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }).toList()),
            /* Movie Content Info */
            Expanded(
              child: Container(
                color: Colors.pink,
                margin: EdgeInsets.only(
                    top: 58), //TODO : 나중에 레이아웃을 확인하고 Responsive Size로 변경 필요
                // height: contentResponsiveH,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* Title */
                    Text(
                      "더 스타 이즈 본",
                      style: FontStyles(24.2.sp).movieTitle,
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
                            style: FontStyles(6.59.sp).gRated,
                          ),
                        ),
                        Text(
                          "2018",
                          style: FontStyles(7.59.sp).releaseY,
                        ),
                      ],
                    ),
                    /* Description */
                    Container(
                      width: width * 3 / 5,
                      child: Text(
                        "음악가는 젊은 가수가 명성을 얻도록 돕고 알코올 중독은 자신의 경력을 내리막길로 몰아갑니다.",
                        style: FontStyles(7.59.sp).description,
                      ),
                    ),
                    const SizedBox(),
                    /* Intent Buttons */
                    Container(
                      width: width * 3 / 5,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset("assets/icons/play_ic.svg",
                                    color: Colors.black),
                                const SizedBox(width: 6),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    "컨텐츠",
                                    style: FontStyles(6.5.sp).watchButton,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Wrap(
                            children: const [
                              GradientButton(content: "예고편"),
                              SizedBox(width: 12),
                              GradientButton(content: "추가"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /* Movie List Carousel Slider */
            Expanded(
              child: Container(
                color: Colors.blue,
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
                              aspectRatio: 239 / 328,
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
