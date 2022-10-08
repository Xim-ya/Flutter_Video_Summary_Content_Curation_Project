import 'package:movie_curation/utilities/index.dart';

class ChannelScreenScaffold extends StatelessWidget {
  const ChannelScreenScaffold({
    Key? key,
    required this.backgroundPosterUrl,
    required this.channelInfoSection,
    required this.contentInfoSection,
    required this.contentPosterSlider,
    required this.scaffoldKey,
    required this.drawer,
    required this.drawerBtn,
  }) : super(key: key);

  final Widget channelInfoSection;
  final Widget contentInfoSection;
  final Widget contentPosterSlider;
  final String? backgroundPosterUrl;
  final Widget drawer;
  final Widget drawerBtn;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final sectionWidth = SizeConfig().screenWidth * 0.6;
    return Scaffold(
        resizeToAvoidBottomInset: false, // Screen Resize Effect 제거
        backgroundColor: AppColor.darkGrey,
        key: scaffoldKey,
        endDrawer: drawer,
        body: Stack(
          children: [
            /* Content Gradient Bacgkround */
            backgroundPosterUrl != null
                ? GradientPostBackground(
                    backgroundImgUrl: backgroundPosterUrl,
                  )
                : const SizedBox(),
            Container(
              padding: EdgeInsets.only(
                  top: contentTopP, left: contentLeftP, bottom: contentBottomP),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /** Top Section **/
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /* Channel Main Info */
                        channelInfoSection,
                        const Spacer(),
                        contentInfoSection,
                        const Spacer(),
                      ],
                    ),
                  ),
                  contentPosterSlider,
                ],
              ),
            ),
          ],
        ));
  }
}
