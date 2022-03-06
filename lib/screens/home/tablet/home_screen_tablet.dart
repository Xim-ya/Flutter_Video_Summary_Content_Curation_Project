import 'package:movie_curation/utilities/index.dart';

class HomeScreenT extends StatelessWidget {
  const HomeScreenT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      /* Content Image Background  (Image & Gradient Linear Background) */
      Image.asset(
        "assets/images/movie_poster.jpeg",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              kDarkGrey,
              kDarkGrey.withOpacity(0.95),
              kDarkGrey.withOpacity(0.9),
              kDarkGrey.withOpacity(0.7),
              kDarkGrey.withOpacity(0.5),
              kDarkGrey.withOpacity(0.4),
            ],
            tileMode: TileMode.clamp,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(
            top: contentTopP, left: contentLeftP, bottom: contentBottomP),
        child: Text("TEMP"),
      ),
    ]);
  }

  /* Responsive Size */
  static double contentTopP = 8.2.h; // 112px (ipad 12.9)
  static double contentLeftP = 6.2.h; // 84px (ipad 12.9)
  static double contentBottomP = 4.1.h; // 56px (ipad 12.9)
  static double groupButtonTextSize = 10.55.sp; // 36px (ipad 12.9)
}
