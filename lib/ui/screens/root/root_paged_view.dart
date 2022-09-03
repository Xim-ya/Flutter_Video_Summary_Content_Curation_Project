import 'package:movie_curation/ui/screens/channel/channel_screen.dart';
import 'package:movie_curation/ui/screens/channel/channel_view_model.dart';
import 'package:movie_curation/utilities/index.dart';

class RootPagedView extends HookWidget {
  RootPagedView({Key? key}) : super(key: key);

  // PagedView에서 관리하는 스크린 리스트
  final List<Widget> screenList = [
    const HomePagedView(),
    const SearchPagedView(),
    const ChannelScreen(),
    const TempScreen4(),
  ];

  // PagedView(Screen) 탭뷰 라우트 할 때 직접 필요없는 컨트롤러를 dispose해주는 메소드
  void disposeControllerIfNeeded() {
    if (Get.isRegistered<HomeContentDetailViewModel>()) {
      Get.delete<HomeContentDetailViewModel>();
    }
    if (Get.isRegistered<SearchContentDetailViewModel>()) {
      Get.delete<SearchContentDetailViewModel>();
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ChannelViewModel(Get.find()));

    //  PagedViewScreen의 Screen Index
    final _screenIndex = useState(2);

    // PagedView Controller
    final PageController _pagedController = PageController(
        initialPage: _screenIndex.value,
        keepPage:
            true); // Page BuilderController (화면이 전환되어도 이전 화면은 State을 값을 유지)

    return Scaffold(
      resizeToAvoidBottomInset: false, // Screen Resize Effect 제거
      backgroundColor: AppColor.darkGrey,
      body: ResponsiveLayout(
        mobileWidget: const Center(
          child: Text("모바일 플랫폼에서 지원하지 않는 어플리케이션 입니다"),
        ),
        tabletWidget: Row(
          children: [
            Container(
              width: 70,
              color: AppColor.darkGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(),
                  navButton(0, "assets/icons/home_ic.svg", _pagedController,
                      _screenIndex),
                  navButton(1, "assets/icons/search_ic.svg", _pagedController,
                      _screenIndex),
                  navButton(2, "assets/icons/credit_card_ic.svg",
                      _pagedController, _screenIndex),
                  navButton(3, "assets/icons/my_profile_ic.svg",
                      _pagedController, _screenIndex),
                  const SizedBox(),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                  controller: _pagedController,
                  itemCount: screenList.length,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (int page) {
                    disposeControllerIfNeeded();
                    _screenIndex.value = page;
                  },
                  itemBuilder: (context, index) {
                    return screenList[index];
                  }),
            )
          ],
        ),
      ),
    );
  }

  // Navigation Bar Button
  IconButton navButton(int page, String iconPath, PageController controller,
      ValueNotifier<int> selectedScreen) {
    return IconButton(
      onPressed: () {
        controller.animateToPage(page,
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
      icon: SvgPicture.asset(iconPath,
          color:
              selectedScreen.value == page ? AppColor.yellow : AppColor.white),
    );
  }
}
