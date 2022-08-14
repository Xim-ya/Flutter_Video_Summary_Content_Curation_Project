import 'package:movie_curation/utilities/index.dart';

class ContentThumbnailVerticalSlider extends BaseView<SearchViewModel> {
  const ContentThumbnailVerticalSlider({Key? key, required this.routeAction})
      : super(key: key);

  final VoidCallback routeAction;

  @override
  Widget buildView(BuildContext context) {
    return PagedListView(
      pagingController: vm.pagingController,
      builderDelegate: PagedChildBuilderDelegate<ContentModel>(
        itemBuilder: (context, item, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: ContentListTileItem(
            contentItem: item,
            onItemTapped: () => vm.onRouteToContentDetail(
                routeAction: routeAction,
                onContentTappedCallBack: vm.onContentItemTapped(index)),
          ),
        ),
      ),
    );
  }
}
