import 'index.dart';

const Color kYellow = Color(0xFFFFE24B);
const Color kDarkGrey = Color(0xFF1D1D1D);
const Color kLightGrey = Color(0xFF646464);

class FontStyles {
  // Color fontSize;
  double? size;

  FontStyles([this.size]) //size is Optional
      : movieTitle = TextStyle(
          color: Colors.white,
          fontSize: size,
          fontWeight: FontWeight.w500,
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
        ),
        watchButton = TextStyle(
            color: Colors.black, fontSize: size, fontWeight: FontWeight.bold),
        elseButton = TextStyle(
            color: Colors.white, fontSize: size, fontWeight: FontWeight.bold);

  final TextStyle movieTitle;
  final TextStyle gRated;
  final TextStyle releaseY;
  final TextStyle description;
  final TextStyle watchButton;
  final TextStyle elseButton;
}
