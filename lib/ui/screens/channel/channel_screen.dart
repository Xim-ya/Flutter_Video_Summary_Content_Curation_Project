import 'package:movie_curation/utilities/index.dart';

class ChannelScreen extends BaseScreen<ChannelViewModel> {
  final VoidCallback routeAction; // PageViewBuilder 라우트 콜백 함수
  const ChannelScreen({
    Key? key,
    required this.routeAction,
  }) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    final sectionWidth = SizeConfig().screenWidth * 0.6;
    return Obx(
      () => ChannelScreenScaffold(
        backgroundPosterUrl: vm.contentList != null
            ? vm.selectedContent!.backDropUrl ?? vm.selectedContent!.posterUrl
            : null,
        scaffoldKey: vm.scaffoldKey,
        channelInfoSection: vm.channelInfoList != null
            ? _ChannelInfoSection(
                selectedChannelInfo: vm.selectedChannel,
                sectionWidth: sectionWidth,
                openDrawer: vm.openDrawer,
              )
            : const SizedBox(),
        contentInfoSection: _ContentInfoSection(),
        contentPosterSlider: vm.contentList != null
            ? ContentPosterSlider(
                onPosterItemTapped: () => vm.onPosterItemTapped,
                itemPositionsListener: vm.itemPositionListener,
                contentList: vm.contentList,
                itemScrollController: vm.itemScrollController,
              )
            : const SizedBox(),
        drawerBtn: _DrawerBtn(),
        drawer: _ChannelListDrawer(
          channelInfoList: vm.channelInfoList,
        ),
      ),
    );
  }
}

class _ChannelInfoSection extends StatelessWidget {
  const _ChannelInfoSection(
      {required this.sectionWidth,
      required this.selectedChannelInfo,
      required this.openDrawer});

  final ChannelModel? selectedChannelInfo;
  final VoidCallback openDrawer;
  final double sectionWidth;

  @override
  Widget build(BuildContext context) => selectedChannelInfo != null
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: RoundCachedImgContainer(
                          size: 120, imgUrl: selectedChannelInfo!.thumbnailUrl),
                    ),
                    AppSpace.size20,
                    /* Channel & Favorite Badge*/
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              selectedChannelInfo!.name,
                              style: AppTextStyle.web3
                                  .copyWith(color: Colors.white),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SvgPicture.asset("assets/icons/check_ic.svg"),
                          ],
                        ),
                        Text(
                          // "구독자 ${selectedChannelInfo!.subscribers}",
                          "구독자 ${Regex.getSubscriberNumber(selectedChannelInfo!.subscribers)}만명",
                          style: AppTextStyle.headline3
                              .copyWith(color: AppColor.textGrey),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero, primary: Colors.transparent),
                    onPressed: openDrawer,
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
                selectedChannelInfo?.description ?? "설명 없음",
                style: AppTextStyle.headline3.copyWith(color: Colors.white),
              ),
            ),
          ],
        )
      : const NullBox();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
              AppSpace.size24,
              GradientButton(content: '예고편', onBtnTapHandler: () {}),
            ],
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

class _ChannelListDrawer extends StatelessWidget {
  const _ChannelListDrawer({required this.channelInfoList});

  final List<ChannelModel>? channelInfoList;

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: AppColor.subDarkGrey,
        width: SizeConfig().screenWidth * 0.26,
        child: SizedBox(
          width: double.infinity,
          child: ListView.separated(
              padding: const EdgeInsets.only(top: 40),
              shrinkWrap: true,
              itemCount: channelInfoList?.length ?? 0,
              separatorBuilder: (BuildContext context, int index) =>
                  AppSpace.size24,
              itemBuilder: (context, index) {
                final ChannelModel item = channelInfoList![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: ChannelMainInfoContainer(
                    imgSize: 86,
                    name: item.name,
                    subscribers: item.subscribers as int,
                    imgUrl: item.thumbnailUrl,
                  ),
                );
              }),
        ),
      );
}
