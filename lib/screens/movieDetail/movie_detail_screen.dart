import 'package:movie_curation/utilities/index.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ResponsiveLayout(
        mobileWidget: MovieDetailScreenM(),
        tabletWidget: Container(), //TODO 이중 레이아웃 빌더 제거 할 필요 있음.
      ),
    );
  }
}
