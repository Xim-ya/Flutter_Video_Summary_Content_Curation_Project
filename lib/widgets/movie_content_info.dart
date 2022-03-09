import 'package:movie_curation/utilities/index.dart';

class MovieContentInfo extends StatelessWidget {
  const MovieContentInfo({Key? key, required this.routeAction})
      : super(key: key);

  final VoidCallback routeAction;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 4,
      child: Container(
        width: contentResponsiveW,
        margin: EdgeInsets.only(
            top: contentTopP), //TODO : 나중에 레이아웃을 확인하고 Responsive Size로 변경 필요
        // height: contentResponsiveH,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Title */
            Text(
              "더 스타 이즈 본",
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
                "A musician helps a young singer find fame as age and alcoholism send his own career into a downward spiral. ",
                style: FontStyles(5.8.sp).description,
              ),
            ),
            const SizedBox(),
            /* Intent Buttons */
            Container(
              width: width * 3 / 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kYellow,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    onPressed: () {
                      routeAction();
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
                  ),
                  Wrap(
                    children: const [
                      GradientButton(content: "예고편"),
                      SizedBox(width: 12),
                      GradientButton(content: "추가"),
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
