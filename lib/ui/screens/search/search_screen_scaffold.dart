import 'package:movie_curation/utilities/index.dart';

class SearchScreenScaffold extends StatelessWidget {
  const SearchScreenScaffold({
    Key? key,
    required this.searchBar,
    required this.verticalGenreGroupBtn,
    required this.posterBackground,
    required this.verticalContentSlider,
  }) : super(key: key);

  final Widget searchBar;
  final Widget verticalGenreGroupBtn;
  final Widget posterBackground;
  final Widget verticalContentSlider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient Background Container
        posterBackground,
        // Expanded Row Layout
        Row(
          children: [
            /* Left Side (SearchBar & Genre) */
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 40, left: 20),
                // color: Colors.purple.withOpacity(0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* Search Bar */
                    searchBar,
                    /* Genre Group List */
                    verticalGenreGroupBtn
                  ],
                ),
              ),
            ),
            /* Contents List Slider */
            Expanded(
              flex: 2,
              child: verticalContentSlider,
            ),
            /* Right Side (Movie Contents) */
          ],
        ),
      ],
    );
  }
}
