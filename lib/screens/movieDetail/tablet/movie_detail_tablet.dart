import 'package:movie_curation/utilities/index.dart';

class MovieDetailScreenT extends StatelessWidget {
  final VoidCallback routeAction; //;
  const MovieDetailScreenT({Key? key, required this.routeAction})
      : super(key: key);

  void blankAction() {}

  @override
  Widget build(BuildContext context) {
    final movieVM = Get.put(MovieVM(model: MovieCore()));
    print("MOVIE DETAIL TABLET RENDERED");
    return Stack(
      children: [
        GradientPostBackground(movieVM: movieVM),
        backButton(),
        Container(
          child: Row(
            children: [
              /* Left Side */
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(
                      top: contentTopP,
                      left: contentLeftP,
                      bottom: contentBottomP),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieContentInfo(
                          isRoutedMain: false,
                          routeAction: blankAction,
                          movieVM: movieVM),
                      Expanded(flex: 10, child: Container(color: Colors.yellow))
                    ],
                  ),
                ),
              ),
              /* Right Side */
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Positioned backButton() {
    return Positioned(
      left: 30,
      top: 10.8.sp,
      child: IconButton(
        iconSize: 13.5.sp,
        icon: SvgPicture.asset("assets/icons/arrow_left_ic.svg"),
        onPressed: () {
          routeAction();
        },
      ),
    );
  }
}
