import 'package:movie_curation/utilities/index.dart';

class MovieElseInfo extends StatelessWidget {
  final MovieVM movieVM;
  final bool isFetched;
  final int? selectedIndex;

  const MovieElseInfo({
    Key? key,
    required this.movieVM,
    required this.isFetched,
    this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Rate(),
        const SizedBox(height: 10),
        Genre(),
      ],
    );
  }

  /* Genre Section */
  Wrap Genre() {
    return Wrap(
      children: [
        // Genre Title
        Text("Genre", style: FontStyles(kTS50).categoryTitle),
        // Genre List
        Container(
          margin: EdgeInsets.only(top: 4),
          height: kTS50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: movieVM.movieGenreList.length,
            itemBuilder: (context, index) {
              return Text("${movieVM.movieGenreList[index].name}",
                  style: FontStyles(kTS22).categorySubTitle);
            },
            separatorBuilder: (context, index) =>
                Text("/ ", style: FontStyles(kTS22).categorySubTitle),
          ),
        )
      ],
    );
  }

  /* Rate Section */
  Wrap Rate() {
    return Wrap(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Rate Score
            Text(
              isFetched
                  ? movieVM.movieList[selectedIndex ?? 0].voteAverage.toString()
                  : "",
              style: FontStyles(kTS50).categoryTitle,
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
        Text("RATE", style: FontStyles(kTS22).categorySubTitle)
      ],
    );
  }
}
