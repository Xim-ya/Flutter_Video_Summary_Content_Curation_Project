import 'package:movie_curation/utilities/index.dart';

class ShowDialog {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.all(100),
          color: Colors.white,
        );
      },
    );
  }
}
