import 'package:movie_curation/ui/widgets/round_cached_img_container.dart';
import 'package:movie_curation/utilities/index.dart';
import 'package:movie_curation/utilities/resources/fonts.dart';
import 'package:movie_curation/utilities/resources/space.dart';

class ChannelMainInfoContainer extends StatelessWidget {
  const ChannelMainInfoContainer({
    Key? key,
    required this.name,
    required this.imgUrl,
    required this.imgSize,
    required this.subscribers,
  }) : super(key: key);

  final double imgSize;
  final String imgUrl;
  final String name;
  final int subscribers;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: CachedNetworkImage(
                      imageUrl: imgUrl,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset("assets/icons/check_ic.svg"),
                )
              ],
            ),
          ),
          AppSpace.size20,
          /* Channel & Favorite Badge*/
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: AppTextStyle.headline1.copyWith(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "구독자 ${Regex.getSubscriberNumber(subscribers)}만명",
                  style:
                      AppTextStyle.headline3.copyWith(color: AppColor.textGrey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
