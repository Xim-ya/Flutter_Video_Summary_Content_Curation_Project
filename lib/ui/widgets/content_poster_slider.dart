import 'package:movie_curation/utilities/index.dart';

class ContentPosterSlider extends BaseView<HomeViewModel> {
  const ContentPosterSlider({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    // List<dynamic> selectedCategoryContents = movieVM.selectedCategoryContents;

    void chooseMovieHandler(int index) {
      // Scroll to Index 인터렉션
      itemScrollController.scrollTo(
          index: index,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCubic);

      // selectedMovieIndex 설정
      vm.contentSelectHandler(index);
    }

    return Obx(() => Expanded(
          flex: 8,
          child: ScrollablePositionedList.builder(
            padding: EdgeInsets.only(top: contentSliderDivideP),
            itemCount: vm.popularMovieList?.length ?? 0,
            initialScrollIndex: 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ValueListenableBuilder<Iterable<ItemPosition>>(
                valueListenable: itemPositionsListener.itemPositions,
                builder: (context, positions, child) {
                  return GestureDetector(
                    onTap: () {
                      chooseMovieHandler(index);
                      vm.loadYoutubeSearchList();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 32,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: AspectRatio(
                        aspectRatio: 39 / 58,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://image.tmdb.org/t/p/w500${vm.popularMovieList![index].posterUrl}",
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
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
        ));
  }
}
