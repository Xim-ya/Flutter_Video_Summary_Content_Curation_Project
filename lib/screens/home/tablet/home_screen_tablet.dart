import 'package:movie_curation/utilities/index.dart';

class HomeScreenT extends StatelessWidget {
  const HomeScreenT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 112, left: 84, bottom: 56),
      child: Column(
        children: [
          Text(
            "HomeScreen TABLET",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
