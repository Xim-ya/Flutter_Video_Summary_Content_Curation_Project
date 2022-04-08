import 'package:movie_curation/utilities/index.dart';

class HomeScreenM extends StatelessWidget {
  const HomeScreenM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: kDarkGrey,
            child: Center(child: Text("HOME SCREEN MOBILE MODE"))));
  }
}
