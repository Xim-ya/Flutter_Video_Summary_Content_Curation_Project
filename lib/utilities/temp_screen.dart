import 'package:movie_curation/app/config/size_config.dart';
import 'package:movie_curation/utilities/index.dart';

class TempScreen1 extends StatelessWidget {
  const TempScreen1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("TEMP! REDERED");
    return Container(
      color: Colors.red,
      child: Text("TEMP SCREEN 1"),
    );
  }
}

class TempScreen2 extends StatefulWidget {
  const TempScreen2({Key? key}) : super(key: key);

  @override
  State<TempScreen2> createState() => _TempScreen2State();
}

class _TempScreen2State extends State<TempScreen2>
    with AutomaticKeepAliveClientMixin {
  int count = 0;
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );
  @override
  Widget build(BuildContext context) {
    print("TEMP22! REDERED $count");

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 200),
        width: double.infinity,
        child: Container(
          child: Container(),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TempScreen3 extends StatelessWidget {
  const TempScreen3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        child: Center(
          child: Container(
            width: SizeConfig().screenWidth - 100,
            color: Colors.yellow,
            child: Center(
              child: Text(
                "Test Message, 테스트 입니다",
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TempScreen4 extends StatelessWidget {
  const TempScreen4({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("TEMP SCREEN 4"),
    );
  }
}

// Stack(
// children: [
// Container(
// color: Colors.yellow,
// margin: EdgeInsets.only(bottom: 100),
// ),
// Positioned(
// bottom: 60,
// child: Text(
// "넷플릭스에서 찾아낸 숨은 보석같은 미군 작전 영화 [영화리뷰 결말포함], 넷플릭스에서 찾아낸 숨은 보석같은 미군 작전 영화 [영화리뷰 결말포함]",
// style: TextStyle(
// color: Colors.white, fontSize: 20),
// ),
// ),
// ],
// );
