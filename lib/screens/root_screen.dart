import 'package:movie_curation/utilities/index.dart';

/* 디바이스 기기 별(mobile, tablet)별 네비게이션 + 컨텐츠 스크린 구조가 다르기 때문에 디바이스 레이아웃을 감지하고 필요한 위젯을 반환하는 로직을 담고 있는 스크린*/

/* Tablet Layout
   Tablet Navigation Bar
     - Navigation Rail 위젯을 이용하여 Side NavgationBar 위젯을 구현하려고 했지만 디자인 명세에 맞는 UI를 그리는데 제한 있음 (Align 조정이 안됨)
       - 직접 Custom Navigation Bar을 만듬 (
          - React Hook을 사용하여 불필요한 렌더링 방지 (Statefull X)
          - AutomaticKeepAliveClientMixin을 extend하여 여러 RouteScreen State을 유지할 수 있도록 함.

*/

class RootScreen extends HookWidget {
  final screenList = [
    HomeScreen(),
    TempScreen2(),
    TempScreen3(),
    TempScreen4()
  ];

  @override
  Widget build(BuildContext context) {
    final selectedScreen = useState(0);
    final PageController _controller =
        PageController(initialPage: selectedScreen.value, keepPage: true);

    return Scaffold(
      backgroundColor: kDarkGrey,
      body: ResponsiveLayout(
          mobileWidget: Center(
            child: Container(
              child: Text("MOBILE BODY"),
            ),
          ),
          tabletWidget: tabletBody(_controller, selectedScreen)),
    );
  }

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
