import 'package:movie_curation/utilities/index.dart';

class ContentListTileItem extends StatelessWidget {
  const ContentListTileItem(
      {Key? key, required this.contentItem, required this.onItemTapped})
      : super(key: key);

  final ContentModel contentItem;
  final VoidCallback onItemTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onItemTapped()},
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
                    "https://image.tmdb.org/t/p/w500${contentItem.posterUrl}",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                          child: Text(
                            contentItem.title,
                            style: FontStyles().searchedContentTitle,
                            maxLines: 1,
                          ),
                        ),
                        // Release Year
                        Container(
                            margin: const EdgeInsets.only(right: 30),
                            child: Text(
                              contentItem.releaseDate == null
                                  ? "개봉일 미확인"
                                  : Regex.dateYDOTM(contentItem.releaseDate!),
                              style: FontStyles().searchedContentRYear,
                            ))
                      ],
                    ),
                    // Description
                    const SizedBox(height: 10),
                    Text(
                      contentItem.overview == null || contentItem.overview == ''
                          ? "내용 없음"
                          : contentItem.overview!,
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
    );
  }
}
