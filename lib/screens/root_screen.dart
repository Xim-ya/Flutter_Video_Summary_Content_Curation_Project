import 'package:movie_curation/utilities/index.dart';

class RootScreen extends StatelessWidget {
  final PageController _controller = PageController();
  final screenList = [
    TempScreen1(),
    TempScreen2(),
    TempScreen3(),
    TempScreen4()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          mobileWidget: Center(
            child: Container(
              child: Text("MOBILE BODY"),
            ),
          ),
          tabletWidget: tabletBody()),
    );
  }

  Row tabletBody() {
    return Row(
      children: [
        Container(
          width: 70,
          color: kDarkGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(),
              navButton(0, "assets/icons/home_ic.svg"),
              navButton(1, "assets/icons/search_ic.svg"),
              navButton(2, "assets/icons/credit_card_ic.svg"),
              navButton(3, "assets/icons/my_profile_ic.svg"),
              SizedBox(),
            ],
          ),
        ),
        Expanded(
          child: PageView.builder(
              controller: _controller,
              itemCount: screenList.length,
              itemBuilder: (context, index) {
                return screenList[index];
              }),
        )
      ],
    );
  }

  IconButton navButton(int page, String iconPath) {
    return IconButton(
      onPressed: () {
        _controller.animateToPage(page,
            duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      },
      icon: SvgPicture.asset(iconPath, color: Colors.white),
    );
  }
}
