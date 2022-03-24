import 'package:movie_curation/utilities/index.dart';

class YoutubeReviewContentsWheelSlider extends StatelessWidget {
  final YoutubeVM youtubeVM;
  const YoutubeReviewContentsWheelSlider({Key? key, required this.youtubeVM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController =
        ScrollController(initialScrollOffset: 200);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kWS100),
      child: GetBuilder<YoutubeVM>(
          init: youtubeVM,
          builder: (searched) {
            return ClickableListWheelScrollView(
              scrollController: _scrollController,
              itemHeight: 0,
              itemCount: 0,
              onItemTapCallback: (index) {
                print("onItemTapCallback index: $index");
              },
              child: ListWheelScrollView(
                onSelectedItemChanged: (index) {
                  print("on Taps!!: $index");
                },
                controller: _scrollController,
                diameterRatio: 10,
                itemExtent: kHS500,
                children: [
                  ...youtubeVM.youtubeSearchedQueryList.map(
                    (query) {
                      return Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Stack(
                              children: [
                                /* Thumbnail Image */
                                thumbnailImage(query),
                                /* Linear Background */
                                linearBackground(),
                                /* Likes Icon (임시 삭제) */
                                // likes(),
                              ],
                            ),
                          ),
                          /* Youtube Content Title  */
                          contentsTitle(query)
                        ],
                      );
                    },
                  )
                ],
              ),
            );
          }),
    );
  }

  Container contentsTitle(Youtube query) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      child: Text(query.snippet.title,
          maxLines: 2,
          textAlign: TextAlign.start,
          style: FontStyles(kTS22).youtubeReviewTitle),
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

  ClipRRect thumbnailImage(Youtube query) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: CachedNetworkImage(
        imageUrl: query.snippet.thumbnails.medium.url,
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
