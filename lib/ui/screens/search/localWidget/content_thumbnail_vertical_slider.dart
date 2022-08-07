import 'package:movie_curation/utilities/index.dart';

class ContentThumbnailVerticalSlider extends BaseView<SearchViewModel> {
  const ContentThumbnailVerticalSlider({Key? key, required this.routeAction})
      : super(key: key);

  final VoidCallback routeAction;

  @override
  Widget buildView(BuildContext context) {
    return PagedListView(
        pagingController: vm.pagingController,
        builderDelegate: PagedChildBuilderDelegate<ContentModel>(
          itemBuilder: (context, item, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: GestureDetector(
              onTap: () async {
                vm.onContentItemTapped(index).whenComplete(() => routeAction());
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 22, top: 22, left: 32),
                height: 200,
                child: Row(
                  children: [
                    /* Left Side - Image */
                    AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://image.tmdb.org/t/p/w500${item.posterUrl}",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    /* Right Side - Description(title, description, year) */
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 26),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                Flexible(
                                  child: Text(item.title,
                                      style: FontStyles().searchedContentTitle),
                                ),
                                // Release Year
                                Container(
                                    margin: const EdgeInsets.only(right: 30),
                                    child: Text(
                                      Regex.dateYDOTM(item.releaseDate),
                                      style: FontStyles().searchedContentRYear,
                                    ))
                              ],
                            ),
                            // Description
                            const SizedBox(height: 10),
                            Text(
                              item.overview == null || item.overview == ''
                                  ? "내용 없음"
                                  : item.overview!,
                              style: FontStyles().searchedContentDescription,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
