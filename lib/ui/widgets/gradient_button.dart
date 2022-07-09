import 'package:movie_curation/utilities/index.dart';

/* Gradient Style 적용한 Evaluated Button Widget
   HomeScreen(예고편 즐겨찾기 인터페이스로 사용됨)
*/

class GradientButton extends StatelessWidget {
  final String content;
  final Function onBtnTapHandler;
  // final MovieVM movieVM;
  // final VoidCallback showTrailer;
  // final bool? isUsedInMobile;
  const GradientButton({
    Key? key,
    required this.content,
    required this.onBtnTapHandler,
    // required this.movieVM,
    // required this.showTrailer,
    // this.isUsedInMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int? selectedIndex = movieVM.selectedMovieIndex;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      onPressed: () {
        onBtnTapHandler();
      },
      // final passedIndex =
      //     movieVM.selectedCategoryContents[selectedIndex ?? 0].id.toInt();
      // movieVM.fetchTrailer(passedIndex, showTrailer);
      // showTrailer();
      child: Ink(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/play_ic.svg",
                color: Colors.white,
                height: 20,
              ),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  content,
                  style: FontStyles(0, false).elseButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
