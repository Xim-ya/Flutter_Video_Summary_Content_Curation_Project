import 'package:movie_curation/screens/root/root_screen_tablet.dart';
import 'package:movie_curation/utilities/index.dart';

/* 디바이스 기기 별(mobile, tablet)별 네비게이션 바 + 컨텐츠 스크린 구조가 다르기 때문에 디바이스 레이아웃을 감지하고 필요한 위젯을 반환하는 로직을 담고 있는 Root 스크린*/
// TODO: NavigationBar!! (구조가 다르기 때문에 섹션 자체를 쪼개서 접근해야됨)
// Mobile -> BottomNavigationBar
// Tablet -> PageBuilder (Side & Vertical)

class RootScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey,
      body: ResponsiveLayout(
        mobileWidget: RootScreenM(),
        tabletWidget: RootScreenT(),
      ),
    );
  }
}
