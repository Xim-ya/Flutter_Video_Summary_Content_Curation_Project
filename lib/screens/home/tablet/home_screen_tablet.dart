import 'package:movie_curation/utilities/index.dart';

import 'package:movie_curation/utilities/responsive_size.dart';

class HomeScreenT extends StatefulWidget {
  const HomeScreenT({Key? key}) : super(key: key);
  @override
  State<HomeScreenT> createState() => _HomeScreenTState();
}

int _selectedCategoryIndex = 0;

class _HomeScreenTState extends State<HomeScreenT>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    List<String> _categoryOptions = ["인기", "최신", "추천"];

    // 678
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
              Container(
                child: Column(
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
                      width: descriptionWrapperW,
                      child: Text(
                        "음악가는 젊은 가수가 명성을 얻도록 돕고 알코올 중독은 자신의 경력을 내리막길로 몰아갑니다.",
                        style: FontStyles().description,
                      ),
                    ),
                    /* Intent Buttons */
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kYellow,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                  style: FontStyles().watchButton,
                                ),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          onPressed: () {},
                          child: Ink(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Colors.white.withOpacity(0.2),
                                  Colors.white.withOpacity(0.06),
                                ],
                                tileMode: TileMode.clamp,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(
                                  minWidth: 88.0,
                                  minHeight:
                                      36.0), // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/play_ic.svg",
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 6),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                      '예고편',
                                      style: FontStyles().elseButton,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              /* Movie Intent Button List */

              /* Movie List Carousel Slider */
            ],
          )),
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
