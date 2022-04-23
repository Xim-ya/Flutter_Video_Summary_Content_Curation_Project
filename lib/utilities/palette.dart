import 'index.dart';

/* Color */
const Color kYellow = Color(0xFFFFE24B);
const Color kDarkGrey = Color(0xFF1D1D1D);
const Color kLightGrey = Color(0xFF646464);
const Color kCloudyGrey = Color(0xFFB9B9B9);
const Color kCloudyLightGrey = Color(0xFF505050);

class FontStyles {
  double? size;
  bool? isMobile;

  FontStyles([this.size, this.isMobile]) //size 값은 Optional 타입
      /*  Home Screen (Tablet)  */
      : categoryGroupButton = TextStyle(
          fontSize: isMobile ?? false ? 17.7.sp : 9.55.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        movieTitle = TextStyle(
          color: Colors.white,
          fontSize: isMobile ?? false ? 27.2.sp : 15.6.sp,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
        gRated = TextStyle(
          color: Colors.white,
          fontSize: isMobile ?? false ? 12 : 4.69.sp,
          fontWeight: FontWeight.normal,
        ),
        releaseY = TextStyle(
          color: Colors.white,
          fontSize: isMobile ?? false ? 16 : 5.69.sp,
          fontWeight: FontWeight.normal,
        ),
        description = TextStyle(
          color: Colors.white,
          fontSize: isMobile ?? false ? 14 : 5.8.sp,
          fontWeight: FontWeight.normal,
          overflow: TextOverflow.ellipsis,
        ),
        watchButton = TextStyle(
            color: Colors.black,
            fontSize: isMobile ?? false ? 12 : 6.5.sp,
            fontWeight: FontWeight.bold),
        elseButton = TextStyle(
            color: Colors.white,
            fontSize: isMobile ?? false ? 12 : 6.5.sp,
            fontWeight: FontWeight.bold),

        /*  Movie Detail Screen  */
        actorName = TextStyle(
            color: kCloudyGrey,
            fontSize: isMobile ?? false ? 12 : kTS16,
            overflow: TextOverflow.ellipsis),
        categoryTitle = TextStyle(
            color: Colors.white,
            fontSize: isMobile ?? false ? 32 : kTS50,
            fontFamily: 'Staatliches'),
        categorySubTitle = TextStyle(
            color: kCloudyLightGrey,
            fontSize: isMobile ?? false ? 12 : kTS22,
            fontFamily: 'Staatliches'),
        youtubeReviewTitle = TextStyle(
          color: Colors.white,
          fontSize: size,
        ),
        youtubeReviewLikes = const TextStyle(color: Colors.white, fontSize: 16),
        noneOfContentsData = const TextStyle(color: Colors.white, fontSize: 32),

        /* Search Screen */
        searchBarPlaceHolder = TextStyle(
          color: kLightGrey,
          fontSize: isMobile ?? false ? 30 : 7.5.sp,
        ),
        searchBarInputs = TextStyle(
            color: Colors.white,
            fontSize: isMobile ?? false ? 30 : 7.5.sp,
            fontWeight: FontWeight.bold),
        genreOption = TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        searchedContentTitle = const TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        searchedContentDescription =
            TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.5)),
        searchedContentRYear =
            const TextStyle(color: Colors.white, fontSize: 16);

  /* Home Screen */
  late final TextStyle movieTitle;
  late final TextStyle gRated;
  late final TextStyle releaseY;
  late final TextStyle description;
  late final TextStyle watchButton;
  late final TextStyle elseButton;
  late final TextStyle categoryGroupButton;

  /* Movie Detail Screen */
  late final TextStyle actorName;
  late final TextStyle categoryTitle;
  late final TextStyle categorySubTitle;
  late final TextStyle youtubeReviewTitle;
  late final TextStyle youtubeReviewLikes;
  late final TextStyle noneOfContentsData;

  /* Search Screen  */
  late final TextStyle searchBarPlaceHolder;
  late final TextStyle searchBarInputs;
  late final TextStyle genreOption;
  late final TextStyle searchedContentTitle;
  late final TextStyle searchedContentDescription;
  late final TextStyle searchedContentRYear;
}

// 디바이스 종류(Mobile, Tablet)에 따라 각각 다른 사이즈를 반환하는 메소드
double responsiveSize(
    {required double mobileS,
    required double tabletS,
    required bool isMobile}) {
  return isMobile ? mobileS : tabletS;
}
