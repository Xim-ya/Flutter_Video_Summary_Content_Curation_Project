import 'package:movie_curation/ui/widgets/new_gradient_button.dart';
import 'package:movie_curation/utilities/index.dart';
import 'package:movie_curation/utilities/resources/fonts.dart';
import 'package:movie_curation/utilities/resources/space.dart';

class ChannelScreenScaffold extends StatelessWidget {
  const ChannelScreenScaffold({
    Key? key,
    required this.channelContentListView,
    required this.channelInfoCarouselSlider,
    required this.channelThumbnailSlider,
  }) : super(key: key);

  final Widget channelContentListView;
  final Widget channelThumbnailSlider;
  final Widget channelInfoCarouselSlider;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          /* 왼쪽 섹션 */
          Expanded(
            child: Container(
              height: double.infinity,
              child: Stack(
                children: [
                  /* Channel Thumbnail Horizon 리스트 뷰 */
                  channelThumbnailSlider,
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: channelInfoCarouselSlider,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /* 오른쪽 섹션 - channel 영상 리스트 */
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: 374,
            color: AppColor.subDarkGrey,
            height: double.infinity,
            child: channelContentListView,
          ),
        ],
      ),
    );
  }
}
