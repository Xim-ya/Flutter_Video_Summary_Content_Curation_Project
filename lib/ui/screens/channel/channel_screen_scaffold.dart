import 'package:movie_curation/ui/widgets/new_gradient_button.dart';
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
                              ),
                              const Spacer(),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      'assets/icons/like_fill_ic.svg',
                                      height: 32,
                                      width: 32,
                                      color: AppColor.yellow,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            /* 섹션 제목 (comment) */
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Comment",
                                textAlign: TextAlign.end,
                                style: AppTextStyle.headline1
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            /* 유저 대표 코멘트 리스트 */
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '심야' '님',
                                        style: AppTextStyle.headline3
                                            .copyWith(color: Colors.white),
                                      ),
                                      AppSpace.size8,
                                      Text(
                                        '여기 구독자들의 ott를 해지하게끔 만드는 유튜버가 있습니다. 여기 구독자들의 ott를 해지하게끔 만드는 유튜버가 있습니다.',
                                        style: AppTextStyle.body3
                                            .copyWith(color: Colors.white),
                                        maxLines: 6,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '심야' '님',
                                        style: AppTextStyle.headline3
                                            .copyWith(color: Colors.white),
                                      ),
                                      AppSpace.size8,
                                      Text(
                                        '여기 구독자들의 ott를 해지하게끔 만드는 유튜버가 있습니다. 여기 구독자들의 ott를 해지하게끔 만드는 유튜버가 있습니다.',
                                        style: AppTextStyle.body3
                                            .copyWith(color: Colors.white),
                                        maxLines: 6,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '심야' '님',
                                        style: AppTextStyle.headline3
                                            .copyWith(color: Colors.white),
                                      ),
                                      AppSpace.size8,
                                      Text(
                                        '여기 구독자들의 ott를 해지하게끔 만드는 유튜버가 있습니다. 여기 구독자들의 ott를 해지하게끔 만드는 유튜버가 있습니다.',
                                        style: AppTextStyle.body3
                                            .copyWith(color: Colors.white),
                                        maxLines: 6,
                                      ),
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
                );
              },
            ),
          ),

          /* 오른쪽 섹션 - channel 영상 리스트 */
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: 374,
            color: AppColor.subDarkGrey,
            height: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    /* 양상 썸네일 */
                    SizedBox(
                      height: 190,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(19),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgKPqqtQBDi4zHw9qqBgbQ17HMQFVx3vnIgOc_Cr9LyxPjpnMdzKq9pyjdLS1N171d4Dc&usqp=CAU",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    /* 영상 제목 */
                    Text(
                      'Star Wars: Episode I - The Phantom Menace',
                      style:
                          AppTextStyle.headline2.copyWith(color: Colors.white),
                    ),
                    AppSpace.size14,
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.start,
                        direction: Axis.horizontal,
                        children: <Widget>[
                          NewGradientButton(
                            content: '절대적인 몰입감',
                          ),
                          NewGradientButton(
                            content: '적극 추천',
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
