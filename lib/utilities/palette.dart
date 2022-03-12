import 'index.dart';

const Color kYellow = Color(0xFFFFE24B);
const Color kDarkGrey = Color(0xFF1D1D1D);
const Color kLightGrey = Color(0xFF646464);
const Color kCloudyGrey = Color(0xFFB9B9B9);
const Color kCloudyLightGrey = Color(0xFF505050);

class FontStyles {
  double? size;

  FontStyles([this.size]) //size 값은 Optional 타입
      /*  Home Screen (Tablet)  */
      : movieTitle = TextStyle(
          color: Colors.white,
          fontSize: size,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
        gRated = TextStyle(
          color: Colors.white,
          fontSize: size,
          fontWeight: FontWeight.normal,
        ),
        releaseY = TextStyle(
          color: Colors.white,
          fontSize: size,
          fontWeight: FontWeight.normal,
        ),
        description = TextStyle(
          color: Colors.white,
          fontSize: size,
          fontWeight: FontWeight.normal,
          overflow: TextOverflow.ellipsis,
        ),
        watchButton = TextStyle(
            color: Colors.black, fontSize: size, fontWeight: FontWeight.bold),
        elseButton = TextStyle(
            color: Colors.white, fontSize: size, fontWeight: FontWeight.bold),

        /*  Movie Detail Screen  (Tablet)  */
        actorName = TextStyle(
            color: kCloudyGrey,
            fontSize: size,
            overflow: TextOverflow.ellipsis),
        rateTitle = TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: size,
            fontFamily: 'Staatliches'),
        rateSubTitle = TextStyle(
            fontWeight: FontWeight.bold,
            color: kCloudyLightGrey,
            fontSize: size,
            fontFamily: 'Staatliches');

  /* Home Screen (tablet)*/
  final TextStyle movieTitle;
  final TextStyle gRated;
  final TextStyle releaseY;
  final TextStyle description;
  final TextStyle watchButton;
  final TextStyle elseButton;

/* Movie Detail Screen  (tablet)*/
  final TextStyle actorName;
  final TextStyle rateTitle;
  final TextStyle rateSubTitle;
}
