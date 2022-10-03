import 'package:movie_curation/ui/widgets/round_cached_img_container.dart';
import 'package:movie_curation/utilities/index.dart';
import 'package:movie_curation/utilities/resources/fonts.dart';
import 'package:movie_curation/utilities/resources/space.dart';

class ChannelMainInfoContainer extends StatelessWidget {
  const ChannelMainInfoContainer({Key? key, required this.channelImgSize})
      : super(key: key);

  final double channelImgSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: RoundCachedImgContainer(
              size: channelImgSize,
              imgUrl:
                  "https://yt3.ggpht.com/ytc/AMLnZu9tKXzVPuAGTdZ-jfWmuDYRcZwKZlOm6GWpduKnvg=s240-c-k-c0xffffffff-no-rj-mo"),
        ),
        AppSpace.size20,
        /* Channel & Favorite Badge*/
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "어퍼컷Tube",
                  style: AppTextStyle.web3.copyWith(color: Colors.white),
                ),
                SvgPicture.asset("assets/icons/check_ic.svg"),
              ],
            ),
            Text(
              "구독자 69.8만명",
              style: AppTextStyle.headline3.copyWith(color: AppColor.textGrey),
            )
          ],
        )
      ],
    );
  }
}
