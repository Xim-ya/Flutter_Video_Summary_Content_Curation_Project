import 'package:movie_curation/ui/screens/channel/channel_screen_scaffold.dart';
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              /* Channel Main Info */
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const ChannelMainInfoContainer(
                                      channelImgSize: 120),
                                  Container(
                                    margin: const EdgeInsets.only(right: 40),
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
                                              style: AppTextStyle.headline1
                                                  .copyWith(
                                                      color: AppColor.textGrey),
                                            ),
                                            SvgPicture.asset(
                                              "assets/icons/right arrow_ic.svg",
                                              height: 40,
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
                                width: SizeConfig().screenWidth * 0.6,
                                child: Text(
                                  "Lego Star Wars - Stormtrooper in desert (Stop motion shortfilm) #Shorts, Lego Star Wars - Stormtrooper in desert (Stop motion shortfilm) #Shorts, Lego Star Wars - Stormtrooper in desert (Stop motion shortfilm) #Shorts",
                                  style: AppTextStyle.headline3
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),

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
