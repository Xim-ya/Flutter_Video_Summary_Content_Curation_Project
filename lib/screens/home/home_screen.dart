import 'package:movie_curation/utilities/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileWidget: HomeScreenM(),
        tabletWidget: HomeScreenT(),
      ),
    );
  }
}
