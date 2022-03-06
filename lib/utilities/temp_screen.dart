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
  @override
  Widget build(BuildContext context) {
    print("TEMP22! REDERED $count");

    return Center(
      child: Container(
        width: double.infinity,
        color: kDarkGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count ${count}"),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                child: Text("COUNT"))
          ],
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
      color: Colors.blue,
      child: Text("TEMP SCREEN 3"),
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
