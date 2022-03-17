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
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    return Container(
      color: Colors.blue,
      child: Container(),
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
