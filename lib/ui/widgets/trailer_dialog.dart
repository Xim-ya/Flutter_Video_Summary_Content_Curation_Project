import 'package:movie_curation/utilities/index.dart';

// // TODO: Iframe 추가 설정 필요(소리, 테마 컬러 등) + 반응형 Margin
class MovieTrailerDialog extends StatelessWidget {
  const MovieTrailerDialog(
      {Key? key, required this.controller, required this.hasTrailerKey})
      : super(key: key);

  final YoutubePlayerController controller;
  final bool hasTrailerKey;

  @override
  Widget build(BuildContext context) {
    return hasTrailerKey
        ? Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 100),
              color: Colors.white,
              child: YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
              ),
            ),
          )
        : const AlertDialog(
            title: Center(
              child: Text("등록된 예고편이 없습니다."),
            ),
          );
  }
}
