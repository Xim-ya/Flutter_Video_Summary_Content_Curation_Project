import 'package:movie_curation/utilities/index.dart';

class GradientPostBackground extends StatelessWidget {
  const GradientPostBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
      ],
    );
  }
}
