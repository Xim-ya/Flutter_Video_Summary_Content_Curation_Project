import 'package:movie_curation/utilities/index.dart';

class MovieListSlider extends StatelessWidget {
  const MovieListSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        child: ScrollablePositionedList.builder(
          padding: EdgeInsets.only(top: contentSliderDivideP),
          itemCount: 10,
          initialScrollIndex: 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ValueListenableBuilder<Iterable<ItemPosition>>(
              valueListenable: itemPositionsListener.itemPositions,
              builder: (context, positions, child) {
                return GestureDetector(
                  onTap: () {
                    itemScrollController.scrollTo(
                        index: index,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOutCubic);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 32,
                    ),
                    color: Colors.yellow,
                    child: AspectRatio(
                      aspectRatio: 39 / 58,
                    ),
                  ),
                );
              },
            );
          },
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
        ),
      ),
    );
  }
}
