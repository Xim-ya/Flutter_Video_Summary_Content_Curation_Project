import 'package:movie_curation/utilities/index.dart';

class GenreGroupButtonListView extends StatelessWidget {
  const GenreGroupButtonListView(
      {Key? key,
      required this.onGenreBtnTapped,
      required this.selectedGenreKey})
      : super(key: key);

  final Function(int) onGenreBtnTapped;
  final int selectedGenreKey;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 60, right: 60),
        shrinkWrap: true,
        itemCount: genreKeyList.length,
        itemBuilder: (context, index) {
          final genreKey = genreKeyList[index];
          final genreItem = genreDefaults[genreKey];
          return TextButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            onPressed: () => onGenreBtnTapped(genreKey),
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: genreKey == selectedGenreKey
                    ? Border.all(color: kYellow, width: 1)
                    : null,
                borderRadius: BorderRadius.circular(6),
              ),
              margin: const EdgeInsets.only(bottom: 4),
              height: 54,
              child: Text(
                genreItem ?? "장르",
                style: FontStyles().genreOption,
              ),
            ),
          );
        },
      ),
    );
  }
}
