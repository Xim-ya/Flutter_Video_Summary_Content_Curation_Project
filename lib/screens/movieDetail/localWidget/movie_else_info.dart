import 'package:movie_curation/utilities/index.dart';

class MovieElseInfo extends StatelessWidget {
  final MovieVM movieVM;
  final bool isFetched;
  final int? selectedIndex;
  final bool? isUsedInMobile;

  const MovieElseInfo({
    Key? key,
    required this.movieVM,
    required this.isFetched,
    this.selectedIndex,
    this.isUsedInMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MOBILE & TABLET Device 예외처리
    return isUsedInMobile ?? false
        ? Container(
            margin: const EdgeInsets.only(right: 16, top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Rate(),
                const SizedBox(width: 20),
                Genre(),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Rate(),
              const SizedBox(height: 10),
              Genre(),
            ],
          );
  }

  /* Genre Section */
  Column Genre() {
    return Column(
      children: [
        // Genre Title
        Text("Genre", style: FontStyles(0, isUsedInMobile).categoryTitle),
        // Genre List
        Container(
          margin: EdgeInsets.only(top: 4),
          height: kTS50,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: movieVM.movieGenreList.length,
            itemBuilder: (context, index) {
              return Text("${movieVM.movieGenreList[index].name}",
                  style: FontStyles(0, isUsedInMobile).categorySubTitle);
            },
            separatorBuilder: (context, index) => Text("/ ",
                style: FontStyles(0, isUsedInMobile).categorySubTitle),
          ),
        )
      ],
    );
  }

  /* Rate Section */
  Widget Rate() {
    return isUsedInMobile ?? false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Rate Score
                  Text(
                    isFetched
                        ? movieVM.movieList[selectedIndex ?? 0].voteAverage
                            .toString()
                        : "",
                    style: FontStyles(0, isUsedInMobile).categoryTitle,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8, bottom: 10),
                    child: SvgPicture.asset(
                      "assets/icons/yellow_star_ic.svg",
                      width: 16,
                    ),
                  )
                ],
              ),
              // Rate SubTitle
              Text("RATE",
                  style: FontStyles(0, isUsedInMobile).categorySubTitle)
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Rate Score
                  Text(
                    isFetched
                        ? movieVM.movieList[selectedIndex ?? 0].voteAverage
                            .toString()
                        : "",
                    style: FontStyles(0, isUsedInMobile).categoryTitle,
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
              Text("RATE",
                  style: FontStyles(0, isUsedInMobile).categorySubTitle)
            ],
          );
  }
}
