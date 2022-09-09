import 'package:movie_curation/ui/screens/channel/localWidget/channel_main_info_container.dart';
import 'package:movie_curation/utilities/index.dart';
import 'package:movie_curation/utilities/resources/space.dart';

class ChannelScreenScaffold extends StatelessWidget {
  const ChannelScreenScaffold(
      {Key? key, required this.tempBody, required this.scaffoldKey})
      : super(key: key);

  final Widget tempBody;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Screen Resize Effect 제거
      backgroundColor: AppColor.darkGrey,
      key: scaffoldKey,
      endDrawer: Drawer(
        backgroundColor: AppColor.subDarkGrey,
        width: SizeConfig().screenWidth * 0.3,
        child: SizedBox(
          width: double.infinity,
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 40),
            shrinkWrap: true,
            itemCount: 4,
            separatorBuilder: (BuildContext context, int index) =>
                AppSpace.size24,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: ChannelMainInfoContainer(channelImgSize: 100),
            ),
          ),
        ),
      ),
      body: tempBody,
    );
  }
}
