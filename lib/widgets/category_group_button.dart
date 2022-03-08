import 'package:movie_curation/utilities/index.dart';

class CategoryGroupButton extends StatelessWidget {
  const CategoryGroupButton({Key? key, required this.movieVM})
      : super(key: key);

  final MovieVM movieVM;

  @override
  Widget build(BuildContext context) {
    List<String> _categoryOptions = ["인기", "최신", "추천"];
    return Row(
        children: _categoryOptions.map<Widget>((e) {
      int _itemIndex = _categoryOptions.indexWhere((content) => content == e);
      return Container(
        padding: const EdgeInsets.only(right: 8),
        child: TextButton(
          onPressed: () {
            movieVM.updateCategoryIndex(_itemIndex);
          },
          child: Text(
            e,
            style: TextStyle(
                color: Colors.white.withOpacity(
                    movieVM.selectedCategoryIndex == _itemIndex ? 1 : 0.24),
                fontSize: groupButtonTextSize,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList());
  }
}
