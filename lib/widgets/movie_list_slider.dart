import 'package:movie_curation/utilities/index.dart';

class MovieListSlider extends StatelessWidget {
  const MovieListSlider({Key? key, required this.movieVM}) : super(key: key);
  final MovieVM movieVM;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        child: ScrollablePositionedList.builder(
          padding: EdgeInsets.only(top: contentSliderDivideP),
          itemCount: movieVM.movieList.length,
          initialScrollIndex: 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ValueListenableBuilder<Iterable<ItemPosition>>(
              valueListenable: itemPositionsListener.itemPositions,
              builder: (context, positions, child) {
                return GestureDetector(
                  onTap: () {
                    itemScrollController.scrollTo(
                        index: index,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOutCubic);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 32,
                    ),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: AspectRatio(
                      aspectRatio: 39 / 58,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              new CircularProgressIndicator(),
                          imageUrl:
                              "https://image.tmdb.org/t/p/w500${movieVM.movieList[index].posterUrl}",
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
        ),
      ),
    );
  }
}
