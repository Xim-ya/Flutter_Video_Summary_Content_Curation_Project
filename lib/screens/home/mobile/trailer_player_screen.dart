import 'package:movie_curation/utilities/index.dart';

// Mobile Device에서 호출되는 스크린
class TrailerPlayerScreen extends StatelessWidget {
  final MovieVM movieVM;
  const TrailerPlayerScreen({Key? key, required this.movieVM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: YoutubePlayer(
              controller: movieVM.trailerYoutubeController,
              showVideoProgressIndicator: true,
            ),
          ),
        ],
      ),
    );
  }
}
