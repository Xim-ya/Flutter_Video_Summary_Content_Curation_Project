import 'package:movie_curation/utilities/index.dart';

class ContentElseInfo extends StatelessWidget {
  final List<String>? genreList;
  final double? rateScore;

  const ContentElseInfo({
    Key? key,
    required this.genreList,
    required this.rateScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Rate(rateScore: rateScore),
        const SizedBox(height: 10),
        _GenreList(genreList: genreList),
        // Genre(),
      ],
    );
  }
}

class _GenreList extends StatelessWidget {
  const _GenreList({Key? key, required this.genreList}) : super(key: key);
  final List<String>? genreList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Genre Title
        Text("Genre", style: FontStyles(0, false).categoryTitle),
        // Genre List
        SizedBox(
          height: kTS50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: genreList?.length ?? 0,
            itemBuilder: (context, index) {
              return Text(genreList![index],
                  style: FontStyles(0, false).categorySubTitle);
            },
            separatorBuilder: (context, index) =>
                Text("/ ", style: FontStyles(0, false).categorySubTitle),
          ),
        ),
      ],
    );
  }
}

class _Rate extends StatelessWidget {
  const _Rate({Key? key, required this.rateScore}) : super(key: key);
  final double? rateScore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Rate Score
            Text(
              rateScore.toString(),
              style: FontStyles(0, false).categoryTitle,
            ),
            Container(
              margin: EdgeInsets.only(left: 8, bottom: 10),
              child: SvgPicture.asset(
                "assets/icons/yellow_star_ic.svg",
              ),
            )
          ],
        ),
        // Rate SubTitle
        Text("RATE", style: FontStyles(0, false).categorySubTitle)
      ],
    );
  }
}
