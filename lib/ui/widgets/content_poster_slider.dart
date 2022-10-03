import 'package:movie_curation/utilities/index.dart';

class ContentPosterSlider extends StatelessWidget {
  const ContentPosterSlider({
    Key? key,
    required this.onPosterItemTapped,
    required this.contentList,
    required this.itemPositionsListener,
    required this.itemScrollController,
  }) : super(key: key);
  final List<ContentModel>? contentList;
  final VoidCallback onPosterItemTapped;
  final ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ScrollablePositionedList.builder(
        shrinkWrap: true,
        itemCount: contentList?.length ?? 0,
        initialScrollIndex: 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ValueListenableBuilder<Iterable<ItemPosition>>(
            valueListenable: itemPositionsListener.itemPositions,
            builder: (context, positions, child) {
              return GestureDetector(
                onTap: () => onPosterItemTapped,
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
                            "https://image.tmdb.org/t/p/w500${contentList![index].posterUrl}",
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
    );
  }
}
