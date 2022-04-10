import 'package:movie_curation/utilities/index.dart';

class RootScreenM extends HookWidget {
  final screenList = [
    HomeScreenM(),
    TempScreen2(),
    TempScreen3(),
    TempScreen4(),
  ];

  final selectedIndex = useState(0); // React Hook으로 NavigationBar State관리

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkGrey,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kDarkGrey,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex.value, //현재 선택된 Index
          onTap: (int index) {
            selectedIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
                label: "",
                icon: SvgPicture.asset(
                  "assets/icons/home_ic.svg",
                  color: selectedIndex.value == 0 ? kYellow : kLightGrey,
                )),
            BottomNavigationBarItem(
                label: "",
                icon: SvgPicture.asset(
                  "assets/icons/search_ic.svg",
                  color: selectedIndex.value == 1 ? kYellow : kLightGrey,
                )),
            BottomNavigationBarItem(
                label: "",
                icon: SvgPicture.asset(
                  "assets/icons/credit_card_ic.svg",
                  color: selectedIndex.value == 2 ? kYellow : kLightGrey,
                )),
            BottomNavigationBarItem(
                label: "",
                icon: SvgPicture.asset(
                  "assets/icons/my_profile_ic.svg",
                  color: selectedIndex.value == 3 ? kYellow : kLightGrey,
                )),
          ],
        ),
        body: IndexedStack(
          index: selectedIndex.value,
          children: [
            HomeScreenM(),
            TempScreen2(),
            TempScreen3(),
            TempScreen4(),
          ],
        ));
  }
}
