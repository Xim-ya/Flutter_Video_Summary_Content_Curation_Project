/* 해당 소스파일에서 MultiImport 방식으로 Import 구문 작성 필요, YoutubePlayer, YoutubePlayerIframe 패키지가 중복되어 에러 발생 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_curation/ui/widgets/back_arrow_button.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ContentPlayerScreen extends StatelessWidget {
  final String videoId;
  const ContentPlayerScreen({Key? key, required this.videoId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      params: const YoutubePlayerParams(
        startAt: Duration(seconds: 30),
        showControls: true,
        showFullscreenButton: false,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          BackArrowButton(routeAction: Get.back),
          Center(
            child: YoutubePlayerIFrame(
              controller: _controller,
              aspectRatio: 16 / 9,
            ),
          ),
        ],
      ),
    );
  }
}
