import 'package:movie_curation/ui/screens/channel/channel_screen_scaffold.dart';
import 'package:movie_curation/ui/screens/channel/localWidget/ContentInfoContainerNew.dart';
import 'package:movie_curation/ui/screens/channel/localWidget/channel_main_info_container.dart';
import 'package:movie_curation/ui/widgets/new_gradient_button.dart';
import 'package:movie_curation/ui/widgets/round_cached_img_container.dart';
import 'package:movie_curation/utilities/index.dart';
import 'package:movie_curation/utilities/regex.dart';
import 'package:movie_curation/utilities/resources/fonts.dart';
import 'package:movie_curation/utilities/resources/space.dart';

class ChannelScreen extends BaseScreen<HomeViewModel> {
  final VoidCallback routeAction; // PageViewBuilder 라우트 콜백 함수
  const ChannelScreen({
    Key? key,
    required this.routeAction,
  }) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    final sectionWidth = SizeConfig().screenWidth * 0.6;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return ChannelScreenScaffold(
        scaffoldKey: _scaffoldKey,
        tempBody: Obx(
          () => vm.selectedContentList != null && vm.loading.isFalse
              ? Stack(
                  children: [
                    /* Content Gradient Bacgkround */
                    GradientPostBackground(
                      backgroundImgUrl: vm.selectedContent?.backDropUrl ??
                          vm.selectedContent?.posterUrl,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: contentTopP,
                          left: contentLeftP,
                          bottom: contentBottomP),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /** Top Section **/
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                /* Channel Main Info */
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const ChannelMainInfoContainer(
                                            channelImgSize: 120),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 40),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                primary: Colors.transparent),
                                            onPressed: () {
                                              _scaffoldKey.currentState!
                                                  .openEndDrawer();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    "더 많은 채널 보기",
                                                    style: AppTextStyle
                                                        .headline1
                                                        .copyWith(
                                                            color: AppColor
                                                                .textGrey),
                                                  ),
                                                  SvgPicture.asset(
                                                    "assets/icons/right arrow_ic.svg",
                                                    height: 32,
                                                    color: AppColor.yellow
                                                        .withOpacity(0.8),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    AppSpace.size40,
                                    /* Channel Description */
                                    SizedBox(
                                      width: sectionWidth,
                                      child: Text(
                                        "Lego Star Wars - Stormtrooper in desert (Stop motion shortfilm) #Shorts, Lego Star Wars - Stormtrooper in desert (Stop motion shortfilm) #Shorts, Lego Star Wars - Stormtrooper in desert (Stop motion shortfilm) #Shorts",
                                        style: AppTextStyle.headline3
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                    /* Content Info Section */
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "탑건 메버릭",
                                      style: AppTextStyle.headline1
                                          .copyWith(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: AppColor.lightGrey,
                                          ),
                                          child: Text(
                                            vm.selectedContent!.adult ?? false
                                                ? "청소년 관람 불가"
                                                : "일반",
                                            style: FontStyles(0, false).gRated,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          vm.selectedContent!.releaseDate !=
                                                  null
                                              ? Regex.dateYM(vm.selectedContent!
                                                  .releaseDate!)
                                              : "개봉일 확인 불가",
                                          style: FontStyles(0, false).releaseY,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: sectionWidth,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: AppColor.yellow,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                            ),
                                            onPressed: routeAction,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/icons/play_ic.svg",
                                                    height: 20,
                                                    color: Colors.black),
                                                const SizedBox(width: 6),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 2),
                                                  child: Text(
                                                    "인기 컨텐츠",
                                                    style: FontStyles(0, false)
                                                        .watchButton,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          GradientButton(
                                              content: '예고편',
                                              onBtnTapHandler: () {}),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          /** Top Section **/
                          /* Content Post Slider  */
                          const ContentPosterSlider(),
                          /* Category Btn */
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ));
  }
}
