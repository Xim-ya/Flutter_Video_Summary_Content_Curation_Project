import 'package:movie_curation/utilities/index.dart';

class CategoryGroupButton extends StatelessWidget {
  final MovieVM movieVM;
  final bool? isUsedInMobile; // Mobile <--> Tablet 예외처리 작업을 위한 기준 값

  const CategoryGroupButton(
      {Key? key, required this.movieVM, this.isUsedInMobile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: categoryOptions.map<Widget>((e) {
      int _itemIndex = categoryOptions.indexWhere((content) => content == e);
      return Container(
        padding: EdgeInsets.only(right: isUsedInMobile ?? false ? 0 : 8),
        child: TextButton(
          onPressed: () {
            movieVM.fetchPopularDrama();
            movieVM.updateCategoryIndex(_itemIndex);
          },
          child: Text(
            e,
            style: TextStyle(
                color: Colors.white.withOpacity(
                    movieVM.selectedCategoryIndex == _itemIndex ? 1 : 0.24),
                fontSize:
                    isUsedInMobile ?? false ? 17.7.sp : groupButtonTextSize,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList());
  }
}
