import 'package:movie_curation/utilities/index.dart';

class MovieContentInfo extends StatelessWidget {
  const MovieContentInfo(
      {Key? key,
      required this.isRoutedMain,
      this.routeAction,
      required this.movieVM,
      required this.showDialog})
      : super(key: key);

  final bool isRoutedMain; // 라우트되는 부모 스크린 판별 변수
  final VoidCallback? routeAction;
  final MovieVM movieVM;
  final VoidCallback showDialog;

  @override
  Widget build(BuildContext context) {
    bool isFetched = movieVM.loadingStatus == LoadingStatus.done ? true : false;
    int? selectedIndex = movieVM.selectedMovieIndex;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 6,
      child: Container(
        width: contentResponsiveW,
        margin: EdgeInsets.only(
            top: contentTopP), //TODO : 나중에 레이아웃을 확인하고 Responsive Size로 변경 필요
        // height: contentReszonsiveH,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Title */
            Text(
              isFetched ? movieVM.movieList[selectedIndex ?? 0].title : "",
              maxLines: 1,
              style: FontStyles(kMovieTitle).movieTitle,
            ),
            /* GRated & Release Year */
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: kLightGrey,
                  ),
                  child: Text(
                    "C18",
                    style: FontStyles(4.69.sp).gRated,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  "2018",
                  style: FontStyles(5.69.sp).releaseY,
                ),
              ],
            ),
            /* Description */
            Container(
              width: width * 3 / 5,
              child: Text(
                isFetched ? movieVM.movieList[selectedIndex ?? 0].overview : "",
                maxLines: 3,
                style: FontStyles(5.8.sp).description,
              ),
            ),
            const SizedBox(),
            /* Intent Buttons */
            Container(
              width: width * 3 / 5,
              child: Row(
                mainAxisAlignment: isRoutedMain
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: [
                  isRoutedMain
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kYellow,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          onPressed: () {
                            final passedIndex = movieVM
                                .movieList[selectedIndex ?? 0].id
                                .toInt();
                            movieVM.fetchGenre(passedIndex);
                            movieVM.fetchActors(passedIndex);
                            routeAction!();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset("assets/icons/play_ic.svg",
                                  color: Colors.black),
                              const SizedBox(width: 6),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(
                                  "컨텐츠",
                                  style: FontStyles(6.5.sp).watchButton,
                                ),
                              )
                            ],
                          ),
                        )
                      : SizedBox(),
                  Wrap(
                    children: [
                      GradientButton(
                        content: "예고편",
                        movieVM: movieVM,
                        showTrailer: showDialog,
                      ),
                      SizedBox(width: 12),
                      GradientButton(
                        content: "추가",
                        movieVM: movieVM,
                        showTrailer: () {
                          print("ADD TO FAVORITE");
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
