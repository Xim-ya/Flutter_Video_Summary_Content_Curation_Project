import 'package:movie_curation/utilities/index.dart';

class SearchedContentDetailListView extends StatelessWidget {
  const SearchedContentDetailListView(
      {Key? key,
      required this.selectedSearchContent,
      required this.routeAction,
      required this.selectedSearchContentIndex})
      : super(key: key);

  final int? selectedSearchContentIndex;
  final ContentModel? selectedSearchContent;
  final VoidCallback routeAction;

  @override
  Widget build(BuildContext context) {
    return selectedSearchContentIndex != null
        ? Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Column(
              children: [
                ContentListTileItem(
                    contentItem: selectedSearchContent!,
                    onItemTapped: routeAction),
              ],
            ),
          )
        : const SizedBox();
  }
}
