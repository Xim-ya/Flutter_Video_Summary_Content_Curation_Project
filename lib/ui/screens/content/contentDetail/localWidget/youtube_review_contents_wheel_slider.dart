import 'package:movie_curation/utilities/index.dart';

class YoutubeReviewContentsWheelSlider extends BaseView<HomeViewModel> {
  const YoutubeReviewContentsWheelSlider(
      {Key? key,
      required this.wheelScrollController,
      required this.youtubeSearchList})
      : super(key: key);

  final ScrollController wheelScrollController;
  final List<YoutubeSearchListItemModel>? youtubeSearchList;

  @override
  Widget buildView(BuildContext context) {
    return youtubeSearchList != null
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: kWS100),
            child: ClickableListWheelScrollView(
              scrollController: wheelScrollController,
              itemHeight: kHS500,
              itemCount: 0,
              onItemTapCallback: (index) {
                final videoId = youtubeSearchList![index].videoId;
                Get.to(() => ContentYoutubePlayerScreen(videoId: videoId!));
              },
              child: ListWheelScrollView(
                controller: wheelScrollController,
                diameterRatio: 10,
                itemExtent: kHS500,
                children: [
                  ...youtubeSearchList!.map(
                    (data) {
                      return Wrap(
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Stack(
                              children: [
                                thumbnailImage(data.thumbnailUrl!),
                                linearBackground(),
                              ],
                            ),
                          ),
                          contentsTitle(data.videoTitle ?? "제목 없음")
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

/* Youtube Content Title  */
  Container contentsTitle(String title) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: Text(title,
          maxLines: 2,
          textAlign: TextAlign.start,
          style: FontStyles(kTS22).youtubeReviewTitle),
    );
  }

  /* Linear Background */
  Container linearBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: <Color>[
            Colors.black.withOpacity(0.7),
            kDarkGrey.withOpacity(0.3),
            kDarkGrey.withOpacity(0.15),
            kDarkGrey.withOpacity(0.1),
          ],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }

  /* Thumbnail Image */
  ClipRRect thumbnailImage(String thumbnailImg) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: CachedNetworkImage(
        imageUrl: thumbnailImg,
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
            const Center(child: Icon(Icons.error)),
      ),
    );
  }
}
