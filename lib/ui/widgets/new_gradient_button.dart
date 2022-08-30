import 'package:movie_curation/utilities/index.dart';
import 'package:movie_curation/utilities/resources/fonts.dart';

/* Gradient Style 적용한 Evaluated Button Widget
   HomeScreen(예고편 즐겨찾기 인터페이스로 사용됨)
*/

class NewGradientButton extends StatelessWidget {
  final String content;
  const NewGradientButton({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.5),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.white.withOpacity(0.2),
              Colors.white.withOpacity(0.06),
            ],
            tileMode: TileMode.clamp,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(minHeight: 38.0),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              content,
              style: AppTextStyle.title2.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
