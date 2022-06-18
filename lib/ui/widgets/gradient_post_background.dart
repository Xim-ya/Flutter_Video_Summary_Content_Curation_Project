import 'package:movie_curation/utilities/index.dart';

class GradientPostBackground extends StatelessWidget {
  final MovieVM movieVM; // VIEW MODEL
  final bool
      isRoutedMain; // HomeScreen(MainScreen),MovieDetail(컨텐츠 상세페이지)에서 각각 다르게 이미지를 호출하기 위한 기준 값
  final bool? isUsedInMobile; // 모바일에서 호출되면 Background Layer을 다른 위젯으로 보여줌.
  const GradientPostBackground(
      {Key? key,
      required this.movieVM,
      required this.isRoutedMain,
      this.isUsedInMobile})
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
        isUsedInMobile ?? false ? darkLayerBox() : gradientLayerBox(),
      ],
    );
  }

  // 모바일 디바이스에서 사용되는 Background Layer
  Container darkLayerBox() {
    return Container(
      color: kDarkGrey.withOpacity(0.86),
    );
  }

  // 테블릿 디바이스에서 사용되는 Background GradientLayer
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
