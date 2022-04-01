import 'package:movie_curation/utilities/index.dart';

class GradientPostBackground extends StatelessWidget {
  final MovieVM movieVM;
  final bool isRoutedMain;
  const GradientPostBackground(
      {Key? key, required this.movieVM, required this.isRoutedMain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFetched = movieVM.loadingStatus == LoadingStatus.done ? true : false;
    List<dynamic> selectedCategoryContents = movieVM.selectedCategoryContents;
    int? selectedIndex = movieVM.selectedMovieIndex;
    return Stack(
      children: [
        isFetched
            ? backgroundImage(selectedCategoryContents, selectedIndex)
            : const SizedBox(),
        gradientLayerBox(),
      ],
    );
  }

  // Dark Gradient Layer 컨테이너ㄴ
  Container gradientLayerBox() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            kDarkGrey,
            kDarkGrey.withOpacity(0.95),
            kDarkGrey.withOpacity(0.9),
            kDarkGrey.withOpacity(0.7),
            kDarkGrey.withOpacity(0.5),
            kDarkGrey.withOpacity(0.4),
          ],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }

  // Gradient Background 뒤로 보여지는 컨텐츠 Background Image
  CachedNetworkImage backgroundImage(
      List<dynamic> selectedCategoryContents, int? selectedIndex) {
    return CachedNetworkImage(
      imageUrl: isRoutedMain // HomeScreen(MainScreen),MovieDetail(컨텐츠 상세페이지)에서 각각 다르게 이미지를 호출
          ? "https://image.tmdb.org/t/p/w500${selectedCategoryContents[selectedIndex ?? 0].backDropUrl}"
          : "https://image.tmdb.org/t/p/w500${selectedCategoryContents[selectedIndex ?? 0].posterUrl}",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
