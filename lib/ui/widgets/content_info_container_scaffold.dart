import 'package:movie_curation/utilities/index.dart';

class ContentInfoContainerScaffold extends StatelessWidget {
  const ContentInfoContainerScaffold(
      {Key? key,
      required this.title,
      required this.gRatedAndReleaseYear,
      required this.overView,
      required this.actionGroupBtn})
      : super(key: key);
  final Widget title;
  final Widget gRatedAndReleaseYear;
  final Widget overView;
  final Widget actionGroupBtn;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        width: contentResponsiveW,
        margin: EdgeInsets.only(
          top: 4.25.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            gRatedAndReleaseYear,
            overView,
            const SizedBox(),
            actionGroupBtn,
          ],
        ),
      ),
    );
  }
}
