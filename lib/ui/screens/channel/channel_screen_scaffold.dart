import 'package:movie_curation/utilities/index.dart';
import 'package:movie_curation/utilities/resources/fonts.dart';
import 'package:movie_curation/utilities/resources/space.dart';

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
                initialPage: 0,
              ),
              itemCount: 10,
              itemBuilder: (context, itemIndex, pageViewIndex) {
                return Container(
                  constraints: const BoxConstraints(
                    maxHeight: 448,
                    maxWidth: 512,
                  ),
                  // margin: const EdgeInsets.symmetric(
                  //     horizontal: 96, vertical: 100),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.subDarkGrey,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            children: <Widget>[
                              /* 채널 프로필 이미지 */
                              SizedBox(
                                height: 70,
                                width: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://user-images.githubusercontent.com/75591730/186290110-699ebab6-7cf6-49cc-bbf9-92cb2aa0304b.jpg",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              AppSpace.size10,
                              /* 채널명 */
                              Text(
                                '어퍼컷',
                                style: AppTextStyle.headline2
                                    .copyWith(color: Colors.white),
                              ),
                              AppSpace.size4,
                              /* 채널 Star Rate */
                              SizedBox(
                                height: 32,
                                child: ListView.separated(
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          AppSpace.size4,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) =>
                                      SvgPicture.asset(
                                          "assets/icons/star_ic.svg"),
                                ),
                              ),
                              Text(
                                '32만 - 38개의 비디오',
                                style: AppTextStyle.body3
                                    .copyWith(color: Colors.white),
                              ),
                              /* 구독자 수 & 비디오 개수 */
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Divider(
                                  color: AppColor.dividerColor,
                                  thickness: 1,
                                ),
                              ),
                              /* 채널 Description */
                              Text(
                                '어퍼컷처럼 날카로운 미드와 영화 이야기',
                                style: AppTextStyle.body1
                                    .copyWith(color: Colors.white),
                                maxLines: 5,
                              ),
                              AppSpace.size24,
                              /* 개발자 채널 설명 */
                              Text(
                                'stop motion made using lego pieces, the story tells about a stormtrooper trying to find water in the desert, but is deceived by mir',
                                style: AppTextStyle.body2
                                    .copyWith(color: Colors.white),
                                maxLines: 5,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
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
