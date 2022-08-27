import 'package:flutter/rendering.dart';
import 'package:movie_curation/utilities/index.dart';

class ChannelScreenScaffold extends StatelessWidget {
  const ChannelScreenScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          /* 왼쪽 섹션 */
          Expanded(
              child: CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    aspectRatio: 1,
                    initialPage: 0,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, itemIndex, pageViewIndex) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 96, vertical: 100),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.subDarkGrey,
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Column(
                            children: <Widget>[
                              /* 채널 프로필 이미지 */
                              Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                    color: AppColor.cloudyGrey,
                                    shape: BoxShape.circle),
                              ),
                              AppSpace.size6,
                              Text(
                                '어퍼컷',
                                style: AppTextStyle.headline2
                                    .copyWith(color: Colors.white),
                              ),
                              SizedBox(
                                height: 32,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) =>
                                        SvgPicture.asset(
                                            "assets/icons/star_ic.svg")),
                              )
                            ],
                          )),
                          Expanded(
                              child: Container(
                            color: Colors.blue,
                          )),
                        ],
                      ),
                    );
                  })),
          /* 오른쪽 섹션 */
          Container(
              width: 374,
              child: Container(
                color: Colors.blue,
              ))
        ],
      ),
    );
  }
}
