import 'package:movie_curation/utilities/index.dart';

/* 디바이스 기기 별(mobile, tablet)별 네비게이션 바 + 컨텐츠 스크린 구조가 다르기 때문에 디바이스 레이아웃을 감지하고 필요한 위젯을 반환하는 로직을 담고 있는 Root 스크린*/
// TODO: NavigationBar!! (구조가 다르기 때문에 섹션 자체를 쪼개서 접근해야됨)
// Mobile -> BottomNavigationBar
// Tablet -> PageBuilder (Side & Vertical)

class RootScreen extends HookWidget {
  final screenList = [
    HomeScreen(),
    TempScreen2(),
    TempScreen3(),
    TempScreen4(),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedScreen = useState(0); // React Hook으로 NavigationBar State관리
    final PageController _controller = PageController(
        initialPage: selectedScreen.value,
        keepPage:
            true); // Page BuilderController (화면이 전환되어도 이전 화면은 State을 값을 유지)

    return Scaffold(
      backgroundColor: kDarkGrey,
      body: ResponsiveLayout(
        mobileWidget: Center(
          child: Container(
            child: Text("MOBILE BOdDY"), // 현재 Tablet 디바이스만 구현
          ),
        ),
        tabletWidget: tabletBody(_controller, selectedScreen),
      ),
    );
  }

  /* Side Navigation Bar (테블릿 버전) ㄴ*/
  Row tabletBody(PageController controller, ValueNotifier<int> selectedScreen) {
    return Row(
      children: [
        Container(
          width: 70,
          color: kDarkGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(),
              navButton(
                  0, "assets/icons/home_ic.svg", controller, selectedScreen),
              navButton(
                  1, "assets/icons/search_ic.svg", controller, selectedScreen),
              navButton(2, "assets/icons/credit_card_ic.svg", controller,
                  selectedScreen),
              navButton(3, "assets/icons/my_profile_ic.svg", controller,
                  selectedScreen),
              SizedBox(),
            ],
          ),
        ),
        Expanded(
          child: PageView.builder(
              controller: controller,
              itemCount: screenList.length,
              scrollDirection: Axis.vertical,
              onPageChanged: (int page) {
                selectedScreen.value = page;
              },
              itemBuilder: (context, index) {
                return screenList[index];
              }),
        )
      ],
    );
  }

  // Navigation Bar Button
  IconButton navButton(int page, String iconPath, PageController controller,
      ValueNotifier<int> selectedScreen) {
    return IconButton(
      onPressed: () {
        controller.animateToPage(page,
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      },
      icon: SvgPicture.asset(iconPath,
          color: selectedScreen.value == page ? kYellow : Colors.white),
    );
  }
}
