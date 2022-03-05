import 'package:movie_curation/utilities/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kDarkGrey,
      body: ResponsiveLayout(
        mobileWidget: HomeScreenM(),
        tabletWidget: HomeScreenT(),
      ),
    );
  }
}
