import 'package:movie_curation/utilities/index.dart';

class ContentPosterSlider extends BaseView<HomeViewModel> {
  const ContentPosterSlider({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => Expanded(
        flex: 8,
        child: ScrollablePositionedList.builder(
          padding: EdgeInsets.only(top: contentSliderDivideP),
          itemCount: HomeViewModel.selectedContentList?.length ?? 0,
          initialScrollIndex: 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ValueListenableBuilder<Iterable<ItemPosition>>(
              valueListenable: vm.itemPositionListener.itemPositions,
              builder: (context, positions, child) {
                return GestureDetector(
                  onTap: () => vm.onPosterItemTapped(index),
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
                              "https://image.tmdb.org/t/p/w500${HomeViewModel.selectedContentList![index].posterUrl}",
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
          itemScrollController: vm.itemScrollController,
          itemPositionsListener: vm.itemPositionListener,
        ),
      ),
    );
  }
}
