import 'package:movie_curation/utilities/index.dart';

class MoviePostSlider extends StatelessWidget {
  const MoviePostSlider({Key? key, required this.movieVM}) : super(key: key);
  final MovieVM movieVM;

  @override
  Widget build(BuildContext context) {
    void chooseMovieHandler(int index) {
      // Scroll to Index 인터렉션
      itemScrollController.scrollTo(
          index: index,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOutCubic);

      // selectedMovieIndex 설정
      movieVM.setSelectedMovie(index);

      // 예고편 키값 호출
      movieVM.fetchTrailer(movieVM.movieList[index].id.toInt());
    }

    return Expanded(
      flex: 8,
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
                    chooseMovieHandler(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      right: 32,
                    ),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: AspectRatio(
                      aspectRatio: 39 / 58,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://image.tmdb.org/t/p/w500${movieVM.movieList[index].posterUrl}",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
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
