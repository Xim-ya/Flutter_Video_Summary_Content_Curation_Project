import 'package:movie_curation/ui/screens/channel/channel_screen_scaffold.dart';
import 'package:movie_curation/ui/screens/channel/localWidget/channel_main_info_container.dart';
import 'package:movie_curation/utilities/index.dart';
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
    // () => vm.selectedContentList != null && vm.loading.isFalse
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return ChannelScreenScaffold(
        backgroundPosterUrl: "/bZLrpWM065h5bu1msUcPmLFsHBe.jpg",
        scaffoldKey: _scaffoldKey,
        channelInfoSection: _ChannelInfoSection(sectionWidth: sectionWidth),
        contentInfoSection: _ContentInfoSection(),
        contentPosterSlider: ContentPosterSlider(),
        drawerBtn: _DrawerBtn(),
        drawer: _ChannelListDrawer());
  }
}

class _ContentInfoSection extends StatelessWidget {
  final sectionWidth = SizeConfig().screenWidth * 0.6;
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "탑건 메버릭",
            style: AppTextStyle.headline1.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColor.lightGrey,
                ),
                child: Text(
                  true ? "청소년 관람 불가" : "일반",
                  style: FontStyles(0, false).gRated,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                true ? Regex.dateYM("2022-05-20") : "개봉일 확인 불가",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.yellow,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/play_ic.svg",
                          height: 20, color: Colors.black),
                      const SizedBox(width: 6),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          "인기 컨텐츠",
                          style: FontStyles(0, false).watchButton,
                        ),
                      )
                    ],
                  ),
                ),
                GradientButton(content: '예고편', onBtnTapHandler: () {}),
              ],
            ),
          )
        ],
      );
}

class _DrawerBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(right: 40),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero, primary: Colors.transparent),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "더 많은 채널 보기",
                  style:
                      AppTextStyle.headline1.copyWith(color: AppColor.textGrey),
                ),
                SvgPicture.asset(
                  "assets/icons/right arrow_ic.svg",
                  height: 32,
                  color: AppColor.yellow.withOpacity(0.8),
                ),
              ],
            ),
          ),
        ),
      );
}

class _ChannelInfoSection extends StatelessWidget {
  const _ChannelInfoSection({required this.sectionWidth});

  final double sectionWidth;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const ChannelMainInfoContainer(channelImgSize: 120),
              Container(
                margin: const EdgeInsets.only(right: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero, primary: Colors.transparent),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "더 많은 채널 보기",
                          style: AppTextStyle.headline1
                              .copyWith(color: AppColor.textGrey),
                        ),
                        SvgPicture.asset(
                          "assets/icons/right arrow_ic.svg",
                          height: 32,
                          color: AppColor.yellow.withOpacity(0.8),
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
              style: AppTextStyle.headline3.copyWith(color: Colors.white),
            ),
          ),
        ],
      );
}

class _ChannelListDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: AppColor.subDarkGrey,
        width: SizeConfig().screenWidth * 0.3,
        child: SizedBox(
          width: double.infinity,
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 40),
            shrinkWrap: true,
            itemCount: 4,
            separatorBuilder: (BuildContext context, int index) =>
                AppSpace.size24,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: ChannelMainInfoContainer(channelImgSize: 100),
            ),
          ),
        ),
      );
}
