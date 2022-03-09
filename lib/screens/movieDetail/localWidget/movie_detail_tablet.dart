import 'package:movie_curation/utilities/index.dart';

class MovieDetailScreenT extends StatelessWidget {
  final VoidCallback routeAction; //
  const MovieDetailScreenT({Key? key, required this.routeAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("MOVIE DETAIL TABLET RENDERED");
    return Center(
      child: Container(
        child: Column(
          children: [
            Text("MOVIE DETAIL SCREEN Tablet Ver"),
            TextButton(
              onPressed: () {
                routeAction();
              },
              child: Text("ROUTE BACK"),
            )
          ],
        ),
      ),
    );
  }
}
