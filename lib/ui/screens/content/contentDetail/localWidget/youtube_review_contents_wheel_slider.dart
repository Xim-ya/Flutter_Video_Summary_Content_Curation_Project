import 'package:movie_curation/ui/common/base/base_view.dart';
import 'package:movie_curation/utilities/index.dart';

class YoutubeReviewContentsWheelSlider extends BaseView<HomeViewModel> {
  final YoutubeVM youtubeVM;
  const YoutubeReviewContentsWheelSlider({Key? key, required this.youtubeVM})
      : super(key: key);

  // 라우팅 동작 (동영상 'videoId' 전달)
  void routeHandler(int selectedIndex) {
    final videoId =
        youtubeVM.youtubeSearchedQueryList[selectedIndex].id.videoId;
    Get.to(() => ContentPlayerScreen(videoId: videoId ?? ""));
  }

  @override
  Widget buildView(BuildContext context) {
    ScrollController _scrollController =
        ScrollController(initialScrollOffset: kWS200);
    return Obx(() => vm.youtubeSearchList == null
        ? GestureDetector(
            onTap: () {
              print(vm.youtubeSearchList?.length ?? "없음");
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(horizontal: kWS100),
            child: GetBuilder<YoutubeVM>(
                init: youtubeVM,
                builder: (searched) {
                  return ClickableListWheelScrollView(
                    scrollController: _scrollController,
                    itemHeight: kHS500,
                    itemCount: 0,
                    onItemTapCallback: (index) {
                      routeHandler(index);
                    },
                    child: ListWheelScrollView(
                      controller: _scrollController,
                      diameterRatio: 10,
                      itemExtent: kHS500,
                      children: [
                        ...vm.youtubeSearchList!.map(
                          (data) {
                            return Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Stack(
                                    children: [
                                      thumbnailImage(data.snippet
                                          .thumbnails["medium"]!["url"]),
                                      linearBackground(),
                                      /* Likes Icon -->(임시 삭제) */
                                      // likes(),
                                    ],
                                  ),
                                ),
                                contentsTitle(data.snippet.title)
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  );
                }),
          ));
  }

/* Youtube Content Title  */
  Container contentsTitle(String title) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
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

  Positioned likes() {
    return Positioned(
      bottom: 20,
      left: 20,
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/like_ic.svg"),
          SizedBox(width: 10),
          Text("632", style: FontStyles().youtubeReviewLikes)
        ],
      ),
    );
  }
}
