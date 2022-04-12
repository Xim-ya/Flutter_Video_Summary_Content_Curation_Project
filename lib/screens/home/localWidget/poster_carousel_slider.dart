import 'package:movie_curation/utilities/index.dart';

class PosterCarouselSlider extends StatelessWidget {
  final MovieVM movieVM;
  const PosterCarouselSlider({
    Key? key,
    required this.movieVM,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final youtubeVM = Get.put(YoutubeVM(model: YoutubeCore()));
    int? selectedIndex = movieVM.selectedMovieIndex;
    void setContentsMetaData(int index) {
      movieVM.setSelectedMovie(index);
      final movieTitle =
          movieVM.selectedCategoryContents[selectedIndex ?? 0].title;
      final passedIndex =
          movieVM.selectedCategoryContents[selectedIndex ?? 0].id.toInt();
      movieVM.fetchGenre(passedIndex);
      movieVM.fetchActors(passedIndex);
      youtubeVM.fetchYoutubeSearchQuery(movieTitle);
    }

    return Expanded(
      flex: 9,
      child: movieVM.loadingStatus == LoadingStatus.done
          ? SizedBox(
              width: double.infinity,
              child: CarouselSlider.builder(
                itemCount: movieVM.selectedCategoryContents.length,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.7,
                    aspectRatio: 215 / 319,
                    initialPage: 0,
                    onPageChanged: (index, _) {
                      movieVM.setSelectedMovie(index);
                    }),
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) {
                  final contents = movieVM.selectedCategoryContents[index];
                  return Container(
                    margin: EdgeInsets.only(top: 14, bottom: 22),
                    child: GestureDetector(
                      onDoubleTap: () {
                        setContentsMetaData(index);
                        // Get.to(() => MovieDetailScreenM());
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://image.tmdb.org/t/p/w500${contents.posterUrl}",
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
                  );
                },
              ))
          : const SizedBox(),
    );
  }
}
