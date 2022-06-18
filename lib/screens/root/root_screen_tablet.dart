import 'package:movie_curation/utilities/index.dart';

class RootScreenT extends HookWidget {
  final screenList = [
    HomePageBuilderT(),
    SearchScreenT(),
    TempScreen3(),
    TempScreen4(),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedScreen = useState(1); // React Hook으로 NavigationBar State관리
    final PageController _controller = PageController(
        initialPage: selectedScreen.value,
        keepPage:
            true); // Page BuilderController (화면이 전환되어도 이전 화면은 State을 값을 유지)

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kDarkGrey,
      body: Row(
        children: [
          Container(
            width: 70,
            color: kDarkGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(),
                navButton(
                    0, "assets/icons/home_ic.svg", _controller, selectedScreen),
                navButton(1, "assets/icons/search_ic.svg", _controller,
                    selectedScreen),
                navButton(2, "assets/icons/credit_card_ic.svg", _controller,
                    selectedScreen),
                navButton(3, "assets/icons/my_profile_ic.svg", _controller,
                    selectedScreen),
                SizedBox(),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
                controller: _controller,
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
          color: selectedScreen.value == page ? kYellow : Colors.white),
    );
  }
}
