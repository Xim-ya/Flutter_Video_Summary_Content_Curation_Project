import 'package:movie_curation/utilities/index.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ContentThumbnailVerticalSlider extends BaseView<SearchViewModel> {
  const ContentThumbnailVerticalSlider({Key? key, required this.routeAction})
      : super(key: key);

  final VoidCallback routeAction;

  @override
  Widget buildView(BuildContext context) {
    return Obx(() => vm.loading.isFalse
        ? SizedBox(
            height: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              controller: vm.verticalScrollController,
              itemCount: vm.selectedContentList!.length + 1 ?? 0,
              itemBuilder: (context, index) {
                if (index < vm.selectedContentList!.length) {
                  final contentItem = vm.selectedContentList![index];
                  return GestureDetector(
                    onTap: () {
                      vm.onContentItemTapped(index);
                      routeAction();
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.only(bottom: 22, top: 22, left: 32),
                      height: 200,
                      child: Row(
                        children: [
                          /* Left Side - Image */
                          AspectRatio(
                            aspectRatio: 1,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://image.tmdb.org/t/p/w500${contentItem.posterUrl}",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Title
                                      Text(contentItem.title,
                                          style: FontStyles()
                                              .searchedContentTitle),
                                      // Release Year
                                      Container(
                                          margin:
                                              const EdgeInsets.only(right: 30),
                                          child: Text(
                                            Regex.dateYDOTM(
                                                contentItem.releaseDate),
                                            style: FontStyles()
                                                .searchedContentRYear,
                                          ))
                                    ],
                                  ),
                                  // Description
                                  const SizedBox(height: 10),
                                  Text(
                                    contentItem.overview == null ||
                                            contentItem.overview == ''
                                        ? "내용 없음"
                                        : contentItem.overview!,
                                    style:
                                        FontStyles().searchedContentDescription,
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
                  );
                } else {
                  return VisibilityDetector(
                    onVisibilityChanged: (VisibilityInfo info) {
                      print(info);
                    },
                    key: const Key("the-end-of-content"),
                    child: Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.red,
                      ),
                    ),
                  );
                }
              },
            ),
          )
        : const Center(child: CircularProgressIndicator()));
  }
}
