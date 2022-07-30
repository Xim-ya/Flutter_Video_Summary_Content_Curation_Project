import 'package:movie_curation/utilities/index.dart';

class YoutubeReviewContentsWheelSlider extends BaseView<HomeViewModel> {
  const YoutubeReviewContentsWheelSlider(
      {Key? key,
      required this.wheelScrollController,
      required this.youtubeSearchList})
      : super(key: key);

  final ScrollController wheelScrollController;
  final List<YoutubeVideoContentModel>? youtubeSearchList;

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
                print(youtubeSearchList![index].profileUrl);
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
                          contentsTitle(data.videoTitle ?? "제목 없음",
                              data.profileUrl ?? "miss Url")
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
  Container contentsTitle(String title, String? profileUrl) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          profileUrl == null || profileUrl == 'miss Url'
              ? SizedBox()
              : Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: CachedNetworkImage(
                        imageUrl: profileUrl,
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
                      )),
                ),
          Flexible(
            child: Text(title,
                maxLines: 2,
                textAlign: TextAlign.start,
                style: FontStyles(kTS22).youtubeReviewTitle),
          )
        ],
      ),
    );
  }

  /* Linear Background */
  Container linearBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        gradient: AppColor.linearYoutubeThumbnailBackground,
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
